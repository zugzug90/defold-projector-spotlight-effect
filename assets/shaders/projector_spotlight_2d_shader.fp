varying mediump vec2 var_texcoord0;
varying mediump vec4 pos;
uniform lowp sampler2D texture_sampler;

#define MAX_LIGHTS 20
uniform lowp vec4 lights[MAX_LIGHTS];
uniform lowp vec4 nLights;
uniform lowp vec4 transparency; // New uniform for global transparency control

#define COLOUR_FRACTION 0.5
//#define COLOUR_FRACTION 1.

void main()
{
    lowp vec4 pixel = texture2D(texture_sampler, var_texcoord0.xy);
    if (pixel.a < 0.01) discard;

    const lowp float target_radius = 50.0;
    const lowp vec3 shadow_tint = vec3(0.1, 0.1, 0.2); // Bluish tint

    lowp float pr = 0.;
    lowp float pg = 0.;
    lowp float pb = 0.;
    lowp float pl = 0.;
    for (lowp int i = 0; i < int(clamp(nLights.x, 0., float(MAX_LIGHTS))); ++i)
    {
        lowp vec4 bulb = lights[i];
        lowp float ibulb = bulb.w;
        lowp float dbulb = distance(bulb.xy, pos.xy);
        if (dbulb > ibulb) { continue; }

        lowp float lbulb = 0.0;
        if (dbulb < target_radius) {
            lbulb = 1.0;
        } else {
            lbulb = (ibulb - dbulb) / (ibulb - target_radius);
            lbulb = clamp(lbulb, 0.0, 1.0);
        }

        pl += lbulb;

        // Unpack color
        lowp int c = int(bulb.z);
        lowp int r = c & 4;
        lowp int g = c & 2;
        lowp int b = c & 1;
        pr += float(r) * COLOUR_FRACTION * lbulb;
        pg += float(g) * COLOUR_FRACTION * lbulb;
        pb += float(b) * COLOUR_FRACTION * lbulb;
    }

    pixel.r = clamp(pr, 0., 0.2);
    pixel.g = clamp(pg, 0., 0.2);
    pixel.b = clamp(pb, 0., 0.2);
    pixel.a = 1. - clamp(pl, 0.1, 1.);

    // Blend bluish tint softly based on light amount
    pixel.rgb = mix(shadow_tint, pixel.rgb, clamp(pl, 0.0, 1.0));

    // Apply global transparency control
    pixel.a *= transparency.x;

    gl_FragColor = pixel;
}
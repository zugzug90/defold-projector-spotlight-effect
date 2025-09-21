components {
  id: "projector_spotlight_controller"
  component: "/scripts/projector_spotlight_controller.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"white_bg_x1280_720\"\n"
  "material: \"/assets/materials/projector_spotlight_material.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/main.atlas\"\n"
  "}\n"
  ""
}

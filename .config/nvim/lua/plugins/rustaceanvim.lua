return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "item",
                enforce = true,
                enable = true,
              },
              prefix = "self",
              merge = {
                imports = true,
              },
            },
          },
        },
      },
    },
  },
}

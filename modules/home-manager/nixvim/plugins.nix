{
  globals,
  pkgs,
  ...
}: {
  programs.nixvim = {
    extraConfigLua = ''
      require('fcitx5').setup({
        define_autocmd = true,
        remember_prior = true,
      })

      require('substitute').setup({})
    '';

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "fcitx5-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "pysan3";
          repo = "fcitx5.nvim";
          rev = "v1.1.0";
          hash = "sha256-AUfakFumvNI4KTYdeUrZc/ybHzgxPNlAGI9pYBYXFFg=";
        };
      })

      (pkgs.vimUtils.buildVimPlugin {
        name = "neorg-templates";
        src = pkgs.fetchFromGitHub {
          owner = "pysan3";
          repo = "neorg-templates";
          rev = "v2.0.3";
          hash = "sha256-nZOAxXSHTUDBpUBS/Esq5HHwEaTB01dI7x5CQFB3pcw=";
        };
      })

      pkgs.vimPlugins.substitute-nvim
    ];

    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
          sources = [
            {name = "luasnip";}
            {name = "neorg";}
            {name = "nvim_lsp";}
            {name = "path";}
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };
      };

      colorizer.enable = true;
      comment.enable = true;
      illuminate.enable = true;
      image.enable = true;
      indent-blankline.enable = true;

      lsp = {
        enable = true;
        servers = {
          clangd = {
            enable = true;
            cmd = ["clangd" "--fallback-style=microsoft" "--offset-encoding=utf-16"];
          };
          marksman.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
          tinymist = {
            enable = true;
            extraOptions.offset_encoding = "utf-8";
          };
        };
      };

      lsp-format.enable = true;
      luasnip.enable = true;

      mini = {
        enable = true;
        mockDevIcons = true;
        modules = {
          icons.__empty = null;
          pick.__empty = null;
        };
      };

      neorg = {
        enable = true;
        settings.load = {
          "core.completion".config.engine = "nvim-cmp";
          "core.concealer".__empty = null;
          "core.defaults".__empty = null;
          "core.dirman".config = {
            workspaces.main = globals.notesDirectory;
            default_workspace = "main";
          };
          "core.journal".config.strategy = "flat";
          "core.latex.renderer".config.render_on_enter = true;
          "external.templates".config.templates_dir = "${globals.notesDirectory}/templates";
        };
      };

      none-ls = {
        enable = true;
        sources = {
          diagnostics = {
            cppcheck.enable = true;
            markdownlint.enable = true;
            pylint = {
              enable = true;
              settings.extra_args = ["--disable=C0114,E0401"];
            };
            statix.enable = true;
          };
          formatting = {
            alejandra.enable = true;
            prettier.enable = true;
          };
        };
      };

      nvim-autopairs = {
        enable = true;
        settings.checkTs = true;
      };

      nvim-tree = {
        enable = true;
        git.ignore = false;
      };

      # obsidian = let
      #   obsidianDirectory = "~/Documents/obsidian";
      # in {
      #   enable = true;
      #   settings = {
      #     daily_notes = {
      #       folder = "journals";
      #       template = "journal_template.md";
      #     };
      #     workspaces = [
      #       {
      #         name = "main";
      #         path = obsidianDirectory;
      #       }
      #     ];
      #     templates.subdir = "templates";
      #   };
      # };

      telescope.enable = true;

      treesitter = {
        enable = true;
        folding = true;
        settings.highlight.enable = true;
      };

      treesitter-context.enable = true;
      typst-vim.enable = true;

      which-key = {
        enable = true;
        settings.spec = [
          {
            __unkeyed = "<leader>t";
            group = "Toggle";
          }
        ];
      };
    };
  };
}

{
  programs.nixvim.plugins = {
    bufferline = {
      enable = true;
      settings.options = {
        alwaysShowBufferline = false;
        offsets = [
          {
            filetype = "NvimTree";
            text = "Explorer";
            highlight = "PanelHeading";
          }
        ];
      };
    };
    cmp = {
      enable = true;
      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        sources = [
          {name = "buffer";}
          {name = "calc";}
          {name = "git";}
          {name = "luasnip";}
          {name = "nvim_lsp";}
          {name = "path";}
        ];
        mapping = {
          "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };
    };
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
        nil-ls.enable = true;
        pyright.enable = true;
      };
    };
    lsp-format.enable = true;
    luasnip.enable = true;
    markdown-preview.enable = true;
    none-ls = {
      enable = true;
      sources = {
        diagnostics = {
          cppcheck.enable = true;
          markdownlint.enable = true;
          pylint = {
            enable = true;
            settings.extra_args = [
              "--disable=C0114,E0401"
            ];
          };
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
      openOnSetup = true;
      git.ignore = false;
    };
    telescope.enable = true;
    toggleterm = {
      enable = true;
      settings = {
        direction = "vertical";
        size = ''
          function(term)
            if term.direction == "horizontal" then
              return vim.o.lines * 0.25
            elseif term.direction == "vertical" then
              return vim.o.columns * 0.5
            end
          end
        '';
      };
    };
    treesitter = {
      enable = true;
      folding = true;
    };
    which-key = {
      enable = true;
      settings.spec = [
        {
          __unkeyed = "<leader>f";
          desc = "Telescope";
          mode = "n";
        }
      ];
    };
  };
}

{pkgs, ...}: {
  home.packages = [pkgs.ripgrep];

  imports = [
    ./keymaps.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    clipboard.register = "unnamedplus";
    defaultEditor = true;
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    opts = {
      cursorline = true;
      expandtab = true;
      foldlevel = 80;
      list = true;
      listchars = {
        tab = "󰌒 ";
        trail = "•";
        nbsp = "␣";
      };
      number = true;
      showbreak = "↪ ";
      signcolumn = "number";
      swapfile = false;
      shiftwidth = 2;
      tabstop = 2;
    };
  };
}

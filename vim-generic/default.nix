{ vim_configurable, vimPlugins }:
let
  vimrc = import ./vimrc.nix {};
in vim_configurable.customize {
  name = "vim-generic";
  vimrcConfig = {
    customRC = vimrc.config;
    packages.myVimPackage = with vimPlugins; {
      start = [ auto-pairs vim-airline vim-airline-themes vim-wakatime vim-nix ];
      opt = [ vim-colors-solarized ];
    };
  };
}

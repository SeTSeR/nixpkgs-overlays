{ vim_configurable, vimPlugins }:
let
  vimrc = import ./vimrc.nix {};
in vim_configurable.customize {
  name = "vim-cpp";
  vimrcConfig = {
    customRC = vimrc.config;
    packages.myVimPackage = with vimPlugins; {
      start = [ auto-pairs vim-airline vim-airline-themes vim-wakatime YouCompleteMe ];
      opt = [ vim-colors-solarized ];
    };
  };
}

{ vim_configurable, vimPlugins }:
let
  vimrc = import ./vimrc.nix {};
in vim_configurable.customize {
  name = "vim-custom";
  vimrcConfig = {
    customRC = vimrc.config;
    packages.myVimPackage = with vimPlugins; {
      start = [ auto-pairs rust-vim vim-airline vim-airline-themes vim-wakatime vim-nix YouCompleteMe ];
      opt = [ vim-colors-solarized ];
    };
  };
}

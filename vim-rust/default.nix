{ vim_configurable, vimPlugins }:
let
  vimrc = import ./vimrc.nix {};
in vim_configurable.customize {
  name = "vim-rust";
  vimrcConfig = {
    customRC = vimrc.config;
    packages.myVimPackage = with vimPlugins; {
      start = [ auto-pairs rust-vim vim-airline vim-airline-themes vim-wakatime ];
      opt = [ vim-colors-solarized ];
    };
  };
}

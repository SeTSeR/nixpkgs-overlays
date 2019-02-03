self: super:
let
  vimrc = import vim-custom/vimrc.nix { pkgs = self.pkgs; };
  vim_configurable = super.pkgs.vim_configurable.override { python = self.python3; };
in
{
  acpilight = self.pkgs.callPackage ./acpilight {};
  vim-custom = vim_configurable.customize {
      name = "vim-custom";
      vimrcConfig = {
          customRC = vimrc.config;
          packages.myVimPackage = with self.pkgs.vimPlugins; {
              start = [ auto-pairs rust-vim vim-airline vim-airline-themes vim-wakatime YouCompleteMe ];
              opt = [ vim-colors-solarized ];
          };
      };
  };
}

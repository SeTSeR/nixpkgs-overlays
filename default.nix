self: super:
{
  acpilight = self.pkgs.callPackage ./acpilight {};
  vim-generic = self.pkgs.callPackage ./vim-generic {};
  vim-cpp = self.pkgs.callPackage ./vim-cpp {
    vim_configurable = super.pkgs.vim_configurable.override { python = self.python3; };
  };
  vim-rust = self.pkgs.callPackage ./vim-rust {};
  vk-messenger = self.pkgs.callPackage ./vk-messenger {};
}

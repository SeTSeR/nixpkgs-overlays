self: super:
{
  acpilight = self.pkgs.callPackage ./acpilight {};
  vim-custom = self.pkgs.callPackage ./vim-custom {
    vim_configurable = super.pkgs.vim_configurable.override { python = self.python3; };
  };
}

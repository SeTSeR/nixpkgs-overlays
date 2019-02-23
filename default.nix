self: super:
{
  acpilight = self.pkgs.callPackage ./acpilight {};
  vim-cpp = self.pkgs.callPackage ./vim-cpp {};
  vim-rust = self.pkgs.callPackage ./vim-rust {};
  vk-messenger = self.pkgs.callPackage ./vk-messenger {};
  cacos = self.pkgs.callPackage ./cacos {};
}

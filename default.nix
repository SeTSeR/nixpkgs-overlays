self: super:
{
  acpilight = self.pkgs.callPackage ./acpilight {};
  vk-messenger = self.pkgs.callPackage ./vk-messenger {};
  cacos = self.pkgs.callPackage ./cacos {};
}

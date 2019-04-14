self: super:
{
  acpilight = self.pkgs.callPackage ./acpilight {};
  cacos = self.pkgs.callPackage ./cacos {};
}

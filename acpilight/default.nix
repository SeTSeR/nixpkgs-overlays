{ stdenv, fetchgit, python36, udev, coreutils }:
stdenv.mkDerivation rec {
  name = "acpilight";

  src = fetchgit {
    url = "https://gitlab.com/wavexx/acpilight.git";
    rev = "f54865ed9a11eedaeffa71af320a3bf36c89f15d";
    sha256 = "1b7rx5bf010rxqkxyjcrplxwr32i066lxpqk729x1vhx0y3n0iv4";
  };

  pyenv = python36.withPackages (pythonPackages: with pythonPackages; [
    argparse
  ]);

  postConfigure = ''
    substituteInPlace Makefile --replace /usr /
    substituteInPlace 90-backlight.rules --replace /bin/ ${coreutils}/bin/
  '';

  buildInputs = [ pyenv udev ];

  makeFlags = [ "DESTDIR=$(out)" ];

  meta = {
    homepage = "https://gitlab.com/wavexx/acpilight";
    description = "ACPI backlight control";
    license = stdenv.lib.licenses.gpl3;
  };
}

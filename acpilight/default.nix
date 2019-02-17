{ stdenv, fetchFromGitHub, python36, udev, coreutils }:
stdenv.mkDerivation rec {
  name = "acpilight";

  src = fetchFromGitHub {
    owner = "SeTSeR";
    repo = "acpilight";
    rev = "ecf103e57293df0af07fc1ee93bba94572600c1f";
    sha256 = "0mvrf8kn8mgppawv6dx7jvljp7khnq3q7smmwkjpha35gdvq1m5w";
  };

  pyenv = python36.withPackages (pythonPackages: with pythonPackages; [
    argparse
  ]);

  postConfigure = ''
    substituteInPlace 90-backlight.rules --replace /bin/ ${coreutils}/bin/
  '';

  buildInputs = [ pyenv udev ];

  makeFlags = [ "DESTDIR=$(out) prefix=/" ];

  meta = {
    homepage = "https://github.com/SeTSeR/acpilight";
    description = "ACPI backlight control";
    license = stdenv.lib.licenses.gpl3;
  };
}

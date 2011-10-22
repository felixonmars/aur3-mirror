# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>

pkgname="sonatina-symphony-orchestra"
_pkg="${pkgname%%-*}"
pkgver=1
pkgrel=1
pkgdesc="A free orchestral sample library by Mattias Westlund, with several patches from the OpenOctave project"
arch=("any")
url="http://sso.mattiaswestlund.net/"
license=("custom:cc-sampling+")
depends=()
optdepends=("linuxsampler: sample and play the SSO SFZ files"
            "oomidi: sequence the SSO SFZ file")
provides=()
conflicts=()
source=("http://downloads.sourceforge.net/project/openoctave/libraries/sonatina1.tar.bz2"
        "cc-sampling-plus.html")
sha256sums=("38aaf1b089eba527863c6681144f102fef945988950e98afda87acc3559bdb4b"
            "ecced12ff5c1776b232e4c03f9d348dadc3e529a4f6a1272c0cdaff44b26cee9")

build() {
  # nothing to do
  return 0
}

package() {
  cd "$srcdir"
  # ensure file mode
  find "$_pkg" -type d -execdir chmod 755 '{}' \;
  find "$_pkg" -type f -execdir chmod 644 '{}' \;
  # license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" cc-sampling-plus.html
  # documentation
  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  mv "${_pkg}/Sonatina Symphonic Orchestra/Readme.html" "${pkgdir}/usr/share/doc/${pkgname}"
  # rest of the package
  install -m755 -d "${pkgdir}/usr/share/sounds"
  mv sonatina "${pkgdir}/usr/share/sounds"
}

# vim:set ts=2 sw=2 et:

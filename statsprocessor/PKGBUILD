# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mauro Andreolini <mauro.andreolini@unimore.it>
pkgname=statsprocessor
pkgver=0.08
pkgrel=1
epoch=
pkgdesc="A high-performance word-generator based on per-position Markov-attack"
arch=('i686' 'x86_64')
url="http://hashcat.net/wiki/doku.php?id=statsprocessor"
license=('unknown')
groups=()
depends=()
makedepends=(util-linux)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://hashcat.net/files/statsprocessor-0.08.7z")
noextract=()
md5sums=('b83820d222ec0505f3509eda1584e610')

package() {

  arch=$(lscpu | grep Architecture | tr -s " " | cut -f 2 -d " ")
  case "$arch" in
    "x86_64"  ) binary="sp64.bin";;
    "amd64"   ) binary="sp64.bin";;
    "i686"    ) binary="sp32.bin";;
    *         ) echo "Unsupported architecture"; reutrn 1;;
  esac

  install -dm755 ${pkgdir}/usr/share/${pkgname}
  install -Dm644 "$srcdir"/${pkgname}-${pkgver}/hashcat.hcstat ${pkgdir}/usr/share/${pkgname}/hashcat.hcstat
  install -Dm755 "$srcdir"/${pkgname}-${pkgver}/${binary} "$pkgdir"/usr/bin/${binary}
}

# vim:set ts=2 sw=2 et:

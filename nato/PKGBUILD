# Maintainer: Mark Ide Jr <mide@cranstonide.com>
pkgname=nato
pkgver=1.2.0
pkgrel=1
pkgdesc="Python script to convert string into NATO alphabet representation"
arch=('any')
url="https://github.com/mide/nato"
license=('MIT')
groups=()
depends=('python>=3')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://raw.githubusercontent.com/mide/nato/v1.2.0/nato.py)
noextract=()
md5sums=('d46832deb096aac2f80a8ef67fdd0d11')

package() {
  install -D -m755 "${srcdir}/nato.py" "${pkgdir}/usr/bin/nato"
}

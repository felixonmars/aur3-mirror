# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=tecs-software-suite
pkgver=2.5
pkgrel=1
epoch=
pkgdesc="The supporting software suite for the book 'The Elements of Computing Systems'"
arch=(any)
url="http://www1.idc.ac.il/tecs/software.html"
license=('GPL3')
groups=()
depends=('java-environment>=1.3.1' 'java-runtime>=1.3.1')
makedepends=('unzip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("http://www1.idc.ac.il/tecs/software/$pkgname-$pkgver.zip"
        "$pkgname.install")

build() {
  cd "$srcdir"
  mkdir -p $pkgdir/opt/$pkgname
}
package() {
  cp -r * $pkgdir/opt/$pkgname
}


# vim:set ts=2 sw=2 et:
md5sums=('624fe75b596b6366a96658545e6bfebe'
         'ab4a629fa6287a96bf985a2dc4d7b5a0')

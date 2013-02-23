# Maintainer: Christophe Calvès <christophe.calves@crans.org>
pkgname=alpha
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="A fast beta virtual machine with video display."
arch=(any)
url="http://calves.me/christophe/wiki/index.php?title=Alpha"
license=('GPL')
groups=()
depends=(java-runtime)
makedepends=(scala sbt proguard m4)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://christophe.calves.me/downloads/Alpha/Alpha-$pkgver.zip")
noextract=()
md5sums=('509fca69018a3e1e19f695260d0d19ab')

build() {
  cd "$srcdir/Alpha"
  make
}

package() {
  cd "$srcdir/Alpha"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

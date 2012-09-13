# Contributor: Samuel Dionne-Riel <samuel@dionne-riel.com>
pkgname=gmediarender
pkgver=0.0.6
pkgrel=2
pkgdesc="An UPnP media renderer."
arch=('i686')
url="http://gmrender.nongnu.org/"
license=('GPL')
groups=()
depends=('libupnp>=1.6.0','gstreamer0.10')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://savannah.nongnu.org/download/gmrender/$pkgname-$pkgver.tar.bz2" "link.patch")
noextract=()
md5sums=('4fc1d5ce6ef2c27fae01d3e3fdc46240'
         '9367a1069f542375212630818504d639')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < $srcdir/link.patch

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

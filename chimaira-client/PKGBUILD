# Maintainer: Dominique Lasserre <lasserre.d@gmail.com>
pkgname=chimaira-client
pkgver=0.3.3
pkgrel=1
pkgdesc="Chimaira allows managing files based on attributes instead of a classical directory tree."
arch=('i686' 'x86_64')
url="http://code.google.com/p/chimaira/"
license=('GPL3')
depends=('dbuster' 'gtk3' 'chimaira-server' 'gstreamer0.10-base' 'dconf' 'hicolor-icon-theme')
makedepends=('vala')
conflicts=('chimaira-client-git')
install="chimaira-client.install"
source=("http://chimaira.googlecode.com/files/chimaira-client_${pkgver}-pre.tar.gz"
        "vapiconfig.patch")
md5sums=('55bc6e73c954a943470d700e626f69a9'
         '082771fb6bd9ddc5cb2b3bfc6d56c7d8')

build() {
  cd "$srcdir/$pkgname"
  patch -p1 -i ../../vapiconfig.patch
  libtoolize --force --install
  ./autogen.sh
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

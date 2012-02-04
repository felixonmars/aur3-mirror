# Contributor: GunsNRose<3444542@163.com>
pkgname=xgcom
pkgver=0.04
pkgrel=1
pkgdesc="A gui tools to help guys develop series port, like minicom"
arch=('i686')
groups=('network')
url="http://code.google.com/p/xgcom"
license=('GPL2')
depends=('make' 'autoconf' 'automake' 'glib2' 'vte' 'gtk2')
makedepends=('subversion')
noextract=()
P=${pkgname}.${pkgver}
source=(http://xgcom.googlecode.com/files/${P}.tar.gz)

build() {
  cd "${srcdir}/${P}"
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
md5sums=('aece2b3fab47a543d97225a6c8dd447c')

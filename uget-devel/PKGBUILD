# Maintainer:  Vyacheslav Mitin <s0n1k@bk.ru>

pkgname=uget-devel
_pkgname=uget
pkgver=1.5.9.2
pkgrel=1
pkgdesc="A download manager featuring download classification and HTML import. Developing version"
arch=('i686' 'x86_64')
url="http://urlget.sourceforge.net/"
license=('LGPL')
depends=('curl>=7.17' 'gtk2>=2.14' 'hicolor-icon-theme')
makedepends=('intltool' 'pkgconfig>=0.9.0')
conflicts=('uget')
replaces=('uget')
install=uget-devel.install
source=(http://downloads.sourceforge.net/urlget/$_pkgname-$pkgver.tar.gz)
md5sums=('7471718815bbba478ea2b9b42460b571')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --disable-notify --disable-gstreamer
  make || return 1
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}


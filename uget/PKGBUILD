# Maintainer:  TDY <tdy@gmx.com>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=uget
pkgver=1.8.0
pkgrel=1
pkgdesc="A download manager featuring download classification and HTML import"
arch=('i686' 'x86_64')
url="http://urlget.sourceforge.net/"
license=('LGPL')
depends=('curl>=7.17' 'gtk2>=2.18' 'hicolor-icon-theme' 'libnotify')
makedepends=('intltool' 'pkgconfig>=0.9.0')
install=uget.install
source=(http://downloads.sourceforge.net/project/urlget/uget%20%28stable%29/$pkgver/uget-$pkgver.tar.gz)
md5sums=('2e0ad66ecdd0104b8fb27b29fdb44df1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-gstreamer
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

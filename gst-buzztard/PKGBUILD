# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=gst-buzztard
pkgver=0.7.0
pkgrel=1
pkgdesc="Buzztard gstreamer extensions"
arch=('i686' 'x86_64')
url="http://www.buzztard.org"
license=('LGPL')
depends=('bml>=0.7.0' 'fluidsynth' 'gstreamer0.10' 'orc')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/buzztard/$pkgname-$pkgver.tar.gz")
md5sums=('ed92a72d08e1d46889004a3b0b9cfbb3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Michele Vascellari <michele.vascellari@gmail.com>

pkgname=paperbox
pkgver=0.4.4
pkgrel=1
pkgdesc="A document browser for indexing and organizing local documents via metadata tags"
arch=('i686' 'x86_64')
url="http://live.gnome.org/PaperBox/"
license=('GPL')
depends=('goocanvas>=0.9' 'gtkmm-utils>=0.4' 'hicolor-icon-theme' 'libglademm'
         'libgnomeui' 'libtracker>=0.6.90')
makedepends=('boost' 'gnome-doc-utils>=0.3.2' 'intltool>=0.35.0'
             'pkgconfig>=0.9.0')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
md5sums=('91734437e83ebb0617d59d2247e95e99')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=caravan
pkgver=0.1.0
pkgrel=2
pkgdesc="Browse Apple trailers and watch them in MPlayer"
arch=('i686' 'x86_64')
url="http://gtk-apps.org/content/show.php/caravan+(Apple+trailer+viewer)?content=141346"
license=('BSD')
depends=('mplayer' 'webkitgtk2')
makedepends=('vala')
source=(http://gnomefiles.org/CONTENT/content-files/141346-caravan.tar.bz2)
md5sums=('490ebe0bcc9519ebee65c8a54d90c811')

build() {
  cd $srcdir
   valac --pkg=gtk+-2.0 --pkg=webkit-1.0 -o caravan caravan.vala
}

package() {
  cd $srcdir
   install -Dm755 caravan $pkgdir/usr/bin/caravan
}

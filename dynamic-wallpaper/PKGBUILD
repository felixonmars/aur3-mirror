# Contributor: Isengrin L. Feuille <Autumnspeech@gmail.com>
pkgname=dynamic-wallpaper
pkgdesc="A python script for generating svg wallpapers based on weather, season and time"
pkgver=0.3.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://dynwallpaper.sourceforge.net/"
license=('GPL')
depends=('pymetar')
source=(http://softlayer.dl.sourceforge.net/sourceforge/dynwallpaper/dynamic-wallpaper031.tar.bz2)
md5sums=('196d79ba0b10a9183c1c9aae26d5a5dc')

build() {
  cd "$srcdir"

  make DESTDIR="$pkgdir/" install
}


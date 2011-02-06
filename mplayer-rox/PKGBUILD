# Contributor: Gary James <garyjames82@gmail.com>
pkgname=mplayer-rox
pkgver=1.8.2b
pkgrel=2
pkgdesc="ROX drag and drop facility for mplayer"
arch=('i686')
url="http://maczewski.dyndns.org/shell/rox/"
license=('GPL')
depends=(rox-lib mplayer)
source=(http://www.maczewski.art.pl/shell/rox/prog/MPlayer-ROX-$pkgver.tar.bz2)
md5sums=('8c96c46ff9e27c734b57d4dd76752af1')

build() {
  cd "$srcdir/MPlayer-ROX"
  rm -R Help
  mkdir -p "$pkgdir/usr/share/mplayer-rox"
  cp -R * "$pkgdir/usr/share/mplayer-rox"
  
}

# vim:set ts=2 sw=2 et:

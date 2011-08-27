# Maintainer: Raizner Evgeniy <razrfalcon@gmail.com>
pkgname=qmediainfo-bzr
pkgver=0.3
pkgrel=1
pkgdesc="Simple MediaInfo parser, based on Qt library"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/QMediaInfo?content=143378"
license=('LGPL')
depends=('qt' 'mediainfo')
makedepends=('bzr')
md5sums=() #generate with 'makepkg -g'

build() {
  bzr branch lp:~razrfalcon/+junk/qmediainfo $pkgname
  cd $srcdir/$pkgname
  qmake -config release
  make
  make INSTALL_ROOT="$pkgdir" install
} 
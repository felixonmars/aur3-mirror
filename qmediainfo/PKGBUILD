# Maintainer: Raizner Evgeniy <razrfalcon@gmail.com>
pkgname=qmediainfo
pkgver=0.2
pkgrel=1
pkgdesc="Simple MediaInfo parser, based on Qt library"
arch=('i686' 'x86_64')
url="https://code.google.com/p/qmediainfo/"
license=('LGPL')
depends=('qt' 'mediainfo')
makedepends=('subversion')
md5sums=() #generate with 'makepkg -g'

build() {
  svn checkout http://qmediainfo.googlecode.com/svn/trunk/ $pkgname
  cd $srcdir/$pkgname
  if [ -n "`locale -a | grep ru`" ]
  then
    lrelease qmediainfo_*.ts
  fi
  qmake -config release
  make
  make INSTALL_ROOT="$pkgdir" install
}
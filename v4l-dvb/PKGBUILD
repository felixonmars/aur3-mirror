# Contributor: Daniele Marinello <m2346zc5-aur@yahoo.it>

# use: "makepkg --skipinteg PKGBUILD"

pkgname=v4l-dvb
pkgver=development
pkgrel=5
pkgdesc="v4l-dvb development repository"
arch=('i686' 'x86_64')
url="http://linuxtv.org/hg/v4l-dvb/"
license=('GPL')
install=v4l-dvb.install
source=('http://linuxtv.org/hg/v4l-dvb/archive/tip.tar.bz2')
md5sums=('0b95329d518a83994042d3aadfba41c4')

build() {
  cd $startdir/src/v4l-dvb-*   

  make || return 1
  #make CONFIG_DVB_FIREDTV:=n || return
  make DESTDIR="$startdir/pkg" install
}

# Maintainer: OwlMind <owlmind@gmail.com>

pkgname=mplayer-skin-clearlooks
pkgver=0.2
pkgrel=1
arch=('any')
pkgdesc="Additional Skin for the MPlayer"
depends=('mplayer-x')
url="http://www.mplayerhq.hu/"
md5sums=('ffa1bfbbf52f5ab8f8e4baac1fc3a611')
sha256sums=('94a6be03b4e0069f71e157debb01a764793bb5e21b808fdb6dd16cb6c472f7c1')
license=('GPL')

source=(http://www.mplayerhq.hu/MPlayer/skins/Clearlooks-1.4.tar.bz2)

build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/mplayer/skins/default
  mv $startdir/src/Clearlooks/*  $startdir/pkg/usr/share/mplayer/skins/default
}

# Maintainer: Arvid Norlander <anmaster A_T tele2 d_o_t (ccTLD for Sweden, which is se)>
# Contributor: Intrepid, edited from Rabyte's PKGBUILD with code from anykey

pkgname=bin32-zsnes
pkgver=1.51
pkgrel=7
pkgdesc="A Super Nintendo emulator"
arch=('x86_64')
url="http://www.zsnes.com/"
license=('GPL')
depends=('lib32-libgl' 'lib32-libpng>=1.4.0' 'lib32-sdl>=1.2' 'lib32-ncurses' 'lib32-libxdamage' 'lib32-gcc-libs')
conflicts=('zsnes' 'zsnes-wip')
source=(ftp://ftp.archlinux.org/community/os/i686/${pkgname/bin32-/}-${pkgver}-${pkgrel}-i686.pkg.tar.gz)
md5sums=('19461d0df9b67051869a9f683fbb8dc5')
sha256sums=('44007bb2678e8958554e4b1255f4660b2a1def137da2aea918569630b46ee7d4')

build() {
  mkdir -p $startdir/pkg/opt/lib32/usr
  cp -R $startdir/src/usr/* $startdir/pkg/opt/lib32/usr
  mkdir $startdir/pkg/usr
  mkdir $startdir/pkg/usr/bin
  ln -s /opt/lib32/usr/bin/zsnes $startdir/pkg/usr/bin
}

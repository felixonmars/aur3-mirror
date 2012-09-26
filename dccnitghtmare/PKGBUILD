# Contributor: galactic_cowboy

pkgname=dccnitghtmare
pkgver=0.10
pkgrel=1
pkgdesc="A free sarcastic 3D single player RPG set in a post-apocalyptical world"
arch=('i686' 'x86_64')
url="http://dnt.dnteam.org/"
license=('code:GPLv3' 'media:GPLv2, CC BY and CC BY-SA')
depends=('cal3d' 'openal' 'sdl_image' 'sdl_ttf' 'libvorbis' 'mesa')
makedepends=('cmake')
categories=('games')
source=('dccnitghtmare.desktop' "http://sourceforge.net/projects/dnt/files/dnt/current/$pkgver/dnt-$pkgver.tar.bz2")
md5sums=('c3e00e70de58ada8ba0676ccd4627251'
         '82c76324634b7d4dc888033c3ba3a35e')

build() {
  cd $srcdir/dnt
  cmake \
    -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
    .
  make
}

package() {

  cd $srcdir/dnt

  make install

  # Install desktop file

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

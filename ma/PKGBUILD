# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=mancala
pkgver=0.1.0
pkgrel=1
pkgdesc="Ancient African board game"
arch=('i686' 'x86_64')
url="http://cmancala.sourceforge.net/"
license=('GPL2')
depends=('sdl_image' 'sdl_ttf' 'ttf-bitstream-vera')
source=(http://sourceforge.net/projects/cmancala/files/mancala-gui/mancala-gui-0.1.0/mancala-gui-0.1.0.tar.gz)
md5sums=('201ae8e5ce77b33a0e79e37da634cfbc')

build() {
  cd $srcdir/mancala-gui-0.1.0/src

  # Compilation
  make

  # Install
  mkdir -p $pkgdir/usr/share/pixmaps/mancala
  cp -r ../res/*.png $pkgdir/usr/share/pixmaps/mancala
  install -Dm755 ./mancala $pkgdir/usr/bin/mancala

  # Symlink to VeraSeBd.ttf fonts
  mkdir -p $pkgdir/usr/share/fonts/bitstream-vera
  ln -s "/usr/share/fonts/TTF/VeraSeBd.ttf" "$pkgdir/usr/share/fonts/bitstream-vera/VeraSeBd.ttf"

  # Desktop icon
  install -Dm644 $startdir/mancala.desktop $pkgdir/usr/share/applications/mancala.desktop
}

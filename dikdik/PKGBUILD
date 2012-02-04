# Maintainer: Cristian Maureira <saint [at] archlinux.cl>

pkgname=dikdik
pkgver=0.0.2
pkgrel=1
pkgdesc="An easy to use VideoCut tool. Based on Qt+phonon and mencoder."
arch=('i686' 'x86_64')
url="http://www.qt-apps.org/content/show.php/DikDik+(VideoCut)?content=118499"
license=('GPL')
depends=('qt' 'mplayer')
source=("http://github.com/jackBauer/Dikdik/tarball/master")
md5sums=('39de8c3ec5252dea8d513d8c55cd4d2a')

build() {
  cd $srcdir/jackBauer-Dikdik-2ec8400

  qmake
  make
  mkdir -p $pkgdir/opt/dikdik
  install -Dm755 VideoCut $pkgdir/opt/dikdik/dikdik
  install -Dm755 VideoCut $pkgdir/usr/bin/dikdik
  cp -R pixmap/ $pkgdir/opt/dikdik
  echo -e "\n\nThe binary file is in /opt/dikdik\n\n"
}

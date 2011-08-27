# Contributor: Ben Duffield <jebavarde@gmail.com>
pkgname=noteo-pacmanstatus
pkgver=0.0.3
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Module for noteo which can check for/launch system updates via pacman"
url="http://sourceforge.net/projects/noteo/"
license=("GPL")
depends=("noteo>=0.0.6" "pygtk")
install=noteo-pacmanstatus.install
source=("http://downloads.sourceforge.net/noteo/${pkgname}-${pkgver}.tar.gz")
md5sums=('1b6981f15413dfd99e0e787754c2fcd9')
build() {
  cd $startdir/src/
  mkdir -p $startdir/pkg/usr/share/noteo
  mv PacmanStatus $startdir/pkg/usr/share/noteo/
}
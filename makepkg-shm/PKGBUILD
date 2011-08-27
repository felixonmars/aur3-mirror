# Contributor: Ramana Kumar <firstname.lastname@gmail.com>
pkgname=makepkg-shm
pkgver=20101009
pkgrel=2
pkgdesc="Speed up makepkg compile times using tmpfs"
arch=('i686' 'x86_64')
url="http://wiki.archlinux.org/index.php//dev/shm"
license=('GPL')
depends=()
makedepends=()
source=($pkgname)
md5sums=('2c47391ce1272a1176f8185fe8f54b0f')
build() {
  mkdir -p $pkgdir/usr/bin
  install $pkgname $pkgdir/usr/bin
}

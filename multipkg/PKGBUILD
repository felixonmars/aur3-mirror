# Author: RetroX <classixretrox@gmail.com>
pkgname=multipkg
pkgver=3.4.1
pkgrel=1
pkgdesc="A modification to makepkg to allow building for other package formats."
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=104817"
license=('GPL')
depends=('pacman')
sources=(multipkg)
md5sums=(6243bec4f611d62831d0c893a276ffcf)

build() {
  mkdir -p $startdir/pkg/usr/bin
  cp $startdir/multipkg $startdir/pkg/usr/bin || return 1
  }

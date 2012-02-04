# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=xcursor-shere-khan-x
pkgver=1.0
pkgrel=1
pkgdesc="Tinic's jaguarx theme with the classic OSX beachball spinner."
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/Shere+Khan+X?content=57588"
license=("Artistic 2.0")
source=(http://www.gnome-look.org/CONTENT/content-files/57588-Shere_Khan_X.tar.gz)
md5sums=('a83f4a4cc99bb7e6c36665ada4e73fad')

build() {
  mkdir -p $startdir/pkg/usr/share/icons/Shere_Khan_X
  cp -r $startdir/src/Shere_Khan_X/* $startdir/pkg/usr/share/icons/Shere_Khan_X/
}

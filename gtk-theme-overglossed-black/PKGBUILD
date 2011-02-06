# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=gtk-theme-overglossed-black
pkgver=0.3
pkgrel=1
pkgdesc="Overglossed GTK 2.0 dark theme - black version"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2')
url=('http://www.gnome-look.org/content/show.php/Overglossed+Black?content=99276')
source=(http://www.gnome-look.org/CONTENT/content-files/99276-OverglossedBlack.tar.gz)
md5sums=('50867910dce3f99b30d376b806564824')

build() {
  mkdir -p $pkgdir/usr/share/themes/OverglossedBlack
  rm -rf $srcdir/OverglossedBlack/meta*
  rm  $srcdir/OverglossedBlack/index.theme~
  cp -r $srcdir/OverglossedBlack/* $pkgdir/usr/share/themes/OverglossedBlack/
}

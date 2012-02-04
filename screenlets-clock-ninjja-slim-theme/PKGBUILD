# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=screenlets-clock-ninjja-slim-theme
pkgver=0.1
pkgrel=1
pkgdesc="Ninnja Slim theme for screenlet clock."
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Ninjja-Slim-Clocks?content=64568"
license=('GPL')
depends=('screenlets')
_filename=64568-Ninjja-Slim-Clocks.tar.bz2
source=(http://gnome-look.org/CONTENT/content-files/$_filename)
md5sums=('abad8eec2ac2ac8285b2a783b7001175')

build() {
  cd "$srcdir/"
  mkdir -p $pkgdir/usr/share/screenlets/Clock/themes/
  
  rm -rf $srcdir/$_filename
  cp -R $srcdir/* $pkgdir/usr/share/screenlets/Clock/themes/
}

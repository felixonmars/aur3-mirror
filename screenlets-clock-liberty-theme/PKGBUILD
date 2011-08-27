# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=screenlets-clock-liberty-theme
pkgver=0.1
pkgrel=1
pkgdesc="Liberty theme for screenlet clock."
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Liberty?content=102282"
license=('GPL')
depends=('screenlets')
_filename=102282-liberty-clock.tar.gz
source=(http://gnome-look.org/CONTENT/content-files/$_filename)
md5sums=('7f45a356213cbb8a6f99493176ec2a73')

build() {
  cd "$srcdir/"
  mkdir -p $pkgdir/usr/share/screenlets/Clock/themes/
  
  rm -rf $srcdir/$_filename
  cp -R $srcdir/* $pkgdir/usr/share/screenlets/Clock/themes/
}

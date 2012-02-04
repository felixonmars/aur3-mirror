# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=gtk-theme-brushed
pkgver=0.1
pkgrel=1
pkgdesc="Yet another gtk theme."
arch=('i686' 'x86_64')
makedepends=('zenity')
url="http://www.gnome-look.org/content/show.php/Brushed?content=32510"
license=('GPL')
source=(http://www.gnome-look.org/CONTENT/content-files/32510-Brushed.tar.gz)
md5sums=('68cfcd8bc62da44381e6663281895ca5')

build() {
  cd "$srcdir/Brushed/"

  mkdir -p $pkgdir/usr/share/themes/
  $srcdir/Brushed/configure
  cd $srcdir
  cp -r $srcdir/Brushed/ $pkgdir/usr/share/themes/
}

# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=gtk-theme-glory
pkgver=0.1alpha
pkgrel=1
pkgdesc="A simple and smooth gtk theme. Also called Glory-Simplex."
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/Glory-Simplex?content=60326"
license=('GPL')
depends=('gtk-engine-pixbuf')
source=(http://www.gnome-look.org/CONTENT/content-files/60326-Glory-Simplex.tar.bz2)
md5sums=('f3b9f206bb097550723e7832dcc354d9')

build() {
  cd "$srcdir/"

  mkdir -p $pkgdir/usr/share/themes/
  cp -r $srcdir/Glory-Simplex $pkgdir/usr/share/themes/
}

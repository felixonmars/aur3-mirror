# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=gtk-theme-gentle-lt
pkgver=na
pkgrel=1
pkgdesc="Another gtk theme."
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/Gentle-LT?content=58356"
license=('GPL')
depends=()
source=(http://www.gnome-look.org/CONTENT/content-files/58356-Gentle-LT.tar.gz)
md5sums=('77e767307a010b915aef2e867620fc37')

build() {
  cd "$srcdir/"

  mkdir -p $pkgdir/usr/share/themes/
  rm -rf $srcdir/Gentle-LT/README
  cp -r $srcdir/Gentle-LT/ $pkgdir/usr/share/themes/
}

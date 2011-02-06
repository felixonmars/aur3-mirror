# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=gtk-theme-osx-tiger
pkgver=0.1
pkgrel=1
pkgdesc="A gtk theme that uses pixbuf engine."
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/OSX-Tiger+theme?content=56577"
license=('GPL')
depends=('gtk-engine-pixbuf')
source=(http://www.gnome-look.org/CONTENT/content-files/56577-gtk-osx-theme.tar.gz)
md5sums=('44e64082569351b7782658d8b358de79')

build() {
  cd "$srcdir/"

  mkdir -p $pkgdir/usr/share/themes/
  cp -r $srcdir/OSX-theme/ $pkgdir/usr/share/themes/
}

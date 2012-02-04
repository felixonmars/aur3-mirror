# Maintainer: Alfredo 'IceCoder' Mungo <chimeranet89@gmail.com>
pkgname=ictools
pkgver=1.1
pkgrel=1
epoch=20110826
pkgdesc="A collections of tools to quickly handle file templates, trash-can and mimetypes from command line."
arch=(any)
url="http://code.google.com/p/ictools/"
license=('GPL')
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(zipman)
install=
changelog=
source=($pkgname.tar)
noextract=()
md5sums=('0ba0c1012e2be3b9d17dad2237335846')

package() {
  cd "$src"
  
  install -D "$srcdir/ic_setup" "$pkgdir/usr/bin/ic_setup"
  install -D "$srcdir/ic_trash" "$pkgdir/usr/bin/ic_trash"
  install -D "$srcdir/ic_template" "$pkgdir/usr/bin/ic_template"
  install -D "$srcdir/ic_mime" "$pkgdir/usr/bin/ic_mime"
  
  install -d "$pkgdir/usr/share/man/man1"
  
  install -t "$pkgdir/usr/share/man/man1" "man/ic_setup.1" "man/ic_mime.1" "man/ic_trash.1" "man/ic_template.1"
  
  echo -e "If you have a ~/.icetoolsrc file, please remove it to ensure this update to work properly."
  
}

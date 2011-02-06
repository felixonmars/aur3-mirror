# Contributor: Nathan Owe. <ndowens04+AUR@gmail.com>
pkgname=pastehtml
pkgver=0
pkgrel=1
pkgdesc="Script to paste text from console to pastehtml.com"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pastehtml"
license=('GPL3')
depends=('bash')
source=(http://pastehtml.googlecode.com/files/$pkgname.sh)
md5sums=('33120c7318f8a3208526f2abbb3a0996') 

build() {
  cd $srcdir/

  install -d $pkgdir/usr/bin
  install -m755 pastehtml.sh $pkgdir/usr/bin/pastehtml
}

# vim:set ts=2 sw=2 et:

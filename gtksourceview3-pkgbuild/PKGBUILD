# Maintainer: josephgbr <rafael.f.f1@gmail.com>

# This package is based on gedit-pkgbuild-highlight from user ech0s7. I did not
# create these pkgbuild.lang and .xml - Just renamed the pkgname (better, IMO)
# and adapted to gtksourceview3

pkgname=gtksourceview3-pkgbuild
pkgver=0.1.0
pkgrel=2
url="http://www.gnome.org"
pkgdesc="PKGBUILD syntax highlight support in gtksourceview3 for Gedit 3 and others"
arch=('any')
license=('GPL')
depends=('shared-mime-info' 'gtksourceview3')
conflicts=('gedit-pkgbuild-highlight')
install="$pkgname.install"
source=('pkgbuild.lang' 'pkgbuild.xml')
md5sums=('c7ac49e8250525d96571fa6b1944014b'
	 '1ebd783f76c5ae95d9a34fc91b50fbdd')

package() {
  install -Dm644 "$srcdir/pkgbuild.xml" \
  		"$pkgdir/usr/share/mime/packages/pkgbuild.xml"
  install -Dm644 "$srcdir/pkgbuild.lang" \
  		"$pkgdir/usr/share/gtksourceview-3.0/language-specs/pkgbuild.lang"
}

# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=inkscape-replace-font
_pkgname=replace_font
pkgver=0.8
pkgrel=1
pkgdesc="An inkscape extension for replacing fonts drawing-wide or within a selection"
arch=('i686' 'x86_64')
url="http://code.google.com/p/inkscape-replace-font/"
license=('GPL')
depends=('inkscape' 'python-lxml')

source=(http://$pkgname.googlecode.com/files/${_pkgname}_${pkgver}.zip)
md5sums=(4866b27bd6b9b8ad86c8d351efa3c1e1)

package() {
  cd $srcdir/
  install -d $pkgdir/usr/share/inkscape/extensions
  install * $pkgdir/usr/share/inkscape/extensions/
}


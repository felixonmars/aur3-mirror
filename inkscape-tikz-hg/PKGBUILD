# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=inkscape-tikz-hg
pkgver=147.bed61d668893
pkgrel=1
pkgdesc="An Inkscape extension for exporting SVG paths as TikZ/PGF paths."
arch=('any')
url="http://code.google.com/p/inkscape2tikz/"
license=('GPL')
depends=('python2-lxml')
optdepends=('inkscape: for using the inksape extension files')
makedepends=('mercurial')
provides=('inkscape-tikz')
conflicts=('inkscape-tikz')
source='hg+https://code.google.com/p/inkscape2tikz/'
md5sums=('SKIP')
_hgrepo=inkscape2tikz

pkgver() {
  cd $srcdir/$_hgrepo
  echo $(hg identify -n).$(hg identify -i)
}

package() {
  cd "$srcdir/$_hgrepo"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  _inkscape_ext="$pkgdir/usr/share/inkscape/extensions"
  install -d "$_inkscape_ext"
  cp ./svg2tikz/extensions/tikz_export* "$_inkscape_ext"
  for _i in inkexlib/inkex.py inkexlib/simplepath.py inkexlib/simplestyle.py \
    extensions/tikz_export.py extensions/tikz_export.py
  do
    sed -i '1s+python+python2+' svg2tikz/${_i}
  done
}

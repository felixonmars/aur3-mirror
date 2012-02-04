pkgname=svgfig2 
pkgver=2.0.0a2
pkgrel=1 
pkgdesc="Quantitative drawing in Python and SVG"
url="http://code.google.com/p/svgfig"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python')
optdepends=('cairo', 'librsvg', 'gtk2')
source=('http://svgfig.googlecode.com/files/svgfig-2.0.0alpha2.tgz')
md5sums=('8c98eab8e5bb5c3054737695c07acd2a')
build() {
  cd $srcdir/svgfig
  python setup.py install --root="$pkgdir" || return 1
}

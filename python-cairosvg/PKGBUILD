# Maintainer: Dennis Fink <dennis.fink@c3l.lu>
# Submitter: Simon Sapin <simon dot sapin at exyr dot org>
pkgname=python-cairosvg
pkgver=1.0.9
pkgrel=1
pkgdesc="A Simple SVG Converter for Cairo"
arch=('any')
url="http://cairosvg.org/"
license=('LGPL3')
depends=('python' 'python-cairo')
optdepends=('python-lxml: To use lxml to parse SVG files'
'python-tinycss: Apply CSS not included in the style attribute of the tags'
'python-pillow: To handle embedded raster images other than PNG')
source=("http://pypi.python.org/packages/source/C/CairoSVG/CairoSVG-${pkgver}.tar.gz")
md5sums=('4a15e7cf8debd205f6a9cc4b17c2e411')

build() {
  cd "$srcdir/CairoSVG-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/CairoSVG-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

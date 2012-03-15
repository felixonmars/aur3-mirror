# Maintainer: Simon Sapin <simon dot sapin at exyr dot org>
pkgname='weasyprint'
pkgver=0.6.1
pkgrel=1
pkgdesc="Converts web documents (HTML, CSS, SVG, ...) to PDF."
arch=('any')
url="http://weasyprint.org/"
license=('AGPL3')
source=("http://pypi.python.org/packages/source/W/WeasyPrint/WeasyPrint-${pkgver}.tar.gz")
makedepends=(
    'python' 'python2'
    'python-distribute' 'python2-distribute'
)
depends=(
    'python' 'python2'
    'python-gobject' 'python2-gobject'
    'python-cairo' 'python2-cairo'
    # XXX as of 2012-03-15, python-lxml is for Python 2.
    'python3-lxml' 'python-lxml'
    'python-pystacia' 'python2-pystacia'
    'python-cssutils>=0.9.9' 'python2-cssutils>=0.9.9'
    'python-cairosvg>=0.3' 'python2-cairosvg>=0.3'
    'pango>=1.29.3'
)
md5sums=('6f401b5787719f5a8f60dd5fcbf8c519')


package() {
  cd "$srcdir/WeasyPrint-$pkgver"
  # Both will install /usr/bin/weasyprint
  # The later (Python 3) will overwrite the former
  python2 setup.py install --root="$pkgdir/" --optimize=1
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

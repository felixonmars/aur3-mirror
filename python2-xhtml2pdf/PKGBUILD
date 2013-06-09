# Maintainer: Zhehao Mao <zhehao.mao@gmail.com>
pkgname=python2-xhtml2pdf
pkgver=0.0.5
pkgrel=4
pkgdesc='PDF generator using HTML and CSS'
arch=('any')
url='http://pypi.python.org/pypi/xhtml2pdf/'
license=('Apache')
depends=('python2-reportlab' 'python2-html5lib' 'python2-pypdf' 'python2-pillow')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/x/xhtml2pdf/xhtml2pdf-$pkgver.tar.gz")
md5sums=('1ef268b40c11bf966f7c6c5504299e3e')

build() {
	  cd "${srcdir}/xhtml2pdf-${pkgver}"
	  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr"
}

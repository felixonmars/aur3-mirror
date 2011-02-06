# Contributor: Georgij Kondratjev <smpuj@bk.ru>
pkgname=odtwriter
pkgver=1.3d
pkgrel=1
pkgdesc="Translates reST (reStructuredText) into a Open Document Format .odt file"
arch=("any")
url="http://www.rexx.com/~dkuhlman/odtwriter.html"
license=("GPL")
depends=(python docutils python-lxml libpaper)
source=("http://www.rexx.com/~dkuhlman/$pkgname-$pkgver.tar.gz")
md5sums=('830b253bf8c153d5894088a95d2f283b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
  python setup.py install --root="$pkgdir"
  chmod 644 "$pkgdir/usr/lib/python2.6/site-packages/docutils/writers/odtwriter/styles.odt"
}


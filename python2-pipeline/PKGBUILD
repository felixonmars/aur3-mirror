# Maintainer: S.Leduc <sebastien@sleduc.fr>

pkgname=python2-pipeline
_realname=python-pipeline
pkgver=0.1.3
pkgrel=2
pkgdesc="Iterator pipelines for Python"
arch=("any")
url="http://jwilk.net/software/python-pipeline"
license=('MIT')
depends=('python2')
source=("http://python-pipeline.googlecode.com/files/$_realname-$pkgver.tar.gz")
md5sums=('1196b494e95dcb5e806d7e4419cf1eb5')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

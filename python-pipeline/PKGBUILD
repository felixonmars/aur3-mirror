# Maintainer: S.Leduc <sebastien@sleduc.fr>

pkgname=python-pipeline
_realname=python3-pipeline
pkgver=0.1.3
pkgrel=2
pkgdesc="Iterator pipelines for Python"
arch=("any")
url="http://jwilk.net/software/python-pipeline"
license=('MIT')
depends=('python')
source=("http://python-pipeline.googlecode.com/files/$_realname-$pkgver.tar.gz")
md5sums=('46bbd5b1e9b0adc670dab6b5811d7fce')

package() {
  cd "$srcdir/$pkgname-$pkgver+py3k"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

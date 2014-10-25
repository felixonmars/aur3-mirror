# DedMar0z

pkgname=python-reverend
pkgver=0.4
pkgrel=2
pkgdesc="Divmod Reverend - a simple Bayesian classifier"
arch=('any')
url="https://launchpad.net/divmod"
license=('LGPL')
depends=('python2')
source=(https://pypi.python.org/packages/source/R/Reverend/Reverend-$pkgver.tar.gz)
md5sums=('1eed6b0218f91fce9a3e243977ae379d')


package() {
  cd $srcdir/Reverend-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr --optimize=1
}

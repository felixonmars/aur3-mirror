# Maintainer: Gary van der Merwe <garyvdm@gmail.com>
pkgname=python-sphinx-paramlinks
pkgver=0.2.2
pkgrel=1
pkgdesc="Allows param links in Sphinx function/method descriptions to be linkable"
arch=(any)
url="https://bitbucket.org/zzzeek/sphinx-paramlinks"
license=('MIT')
depends=('python' 'python-sphinx')
source=(https://pypi.python.org/packages/source/s/sphinx-paramlinks/sphinx-paramlinks-$pkgver.tar.gz)
md5sums=(3e0a74b325b1cb65e917671a3790da7e)

package() {
  cd "$srcdir/sphinx-paramlinks-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}



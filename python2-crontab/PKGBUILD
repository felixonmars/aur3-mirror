# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=python2-crontab
pkgver=1.4.1
pkgrel=1
pkgdesc="Python Crontab API"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/python-crontab/"
license=('GPL3')
depends=('python2' 'python2-dateutil')
source=("http://pypi.python.org/packages/source/p/python-crontab/python-crontab-$pkgver.tar.gz")
md5sums=('39d6f35f3cce6d0d80467c791d1e63b5')

package(){
    cd "$srcdir/python-crontab-$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir"
}


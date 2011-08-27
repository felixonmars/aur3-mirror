# Contributor: Nathan Owe. <ndowens04 at gmail>

pkgname=gitserve-python
_realpkgname=gitserve
pkgver=0.2.0
pkgrel=1
pkgdesc="A helper tool for git that mimics mercurial's serve command"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/gitserve/0.2.0"
source=(http://pypi.python.org/packages/source/g/gitserve/$_realpkgname-$pkgver.tar.gz)
license=('GPL2')
md5sums=('2ac758f65b5205bf57f25ffefae71c11')
depends=('python')

build() {
  cd $srcdir/$_realpkgname-$pkgver
  python setup.py install --root=$pkgdir/
  
}



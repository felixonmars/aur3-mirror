# DedMar0z

pkgname=pyaiml
pkgver=0.8.6
pkgrel=1
pkgdesc="Interpreter for AIML implemented in Python"
arch=('i686' 'x86_64')
url="http://pyaiml.sourceforge.net/"
license=('FREE')
depends=('python')
source=(http://downloads.sourceforge.net/project/pyaiml/PyAIML%20%28unstable%29/$pkgver/PyAIML-$pkgver.tar.gz)
md5sums=('ee46e04da69e06ab13629181841b0ab7')

package() {
  cd $srcdir/PyAIML-$pkgver
    python setup.py install --root=$pkgdir 
    --optimize=1 || return 1
    }

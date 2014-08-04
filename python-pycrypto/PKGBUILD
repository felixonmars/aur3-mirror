# Maintainer: mawcomw <mawcomw@gmail.com>

pkgbase=python-pycrypto
pkgname=('python-pycrypto' 'python2-pycrypto')
pkgver=2.6.1
pkgrel=1
arch=('any')
url="http://www.pycrypto.org/"
license=('CUSTOM')
makedepends=('python2' 'python' 'python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/p/pycrypto/pycrypto-$pkgver.tar.gz")
md5sums=('55a61a054aa66812daf5161a0d5d7eda')

prepare() {
   cp -r pycrypto-${pkgver} python2-pycrypto-${pkgver}
}

build() {
   cd $srcdir/pycrypto-${pkgver}
   python setup.py build
   
   cd $srcdir/python2-pycrypto-${pkgver}
   python2 setup.py build
}

#check(){
#   cd $srcdir/python2-pycrypto-${pkgver}
#   python2 setup.py test
#   
#   cd $srcdir/pycrypto-${pkgver}
#   python setup.py test
#}

package_python-pycrypto() {
   depends=('python' )
   pkgdesc="Cryptographic modules for Python 3."

   cd pycrypto-${pkgver}
   python setup.py install --root="$pkgdir" --optimize=1 

   install -Dm644 LEGAL/copy/LICENSE.orig "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
   install -Dm644 LEGAL/copy/LICENSE.libtom "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.libtom
}

package_python2-pycrypto() {
   depends=('python2' )
   pkgdesc="Cryptographic modules for Python 2."

   cd python2-pycrypto-${pkgver}
   python2 setup.py install --root="$pkgdir" --optimize=1

   install -Dm644 LEGAL/copy/LICENSE.orig "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
   install -Dm644 LEGAL/copy/LICENSE.libtom "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.libtom
}
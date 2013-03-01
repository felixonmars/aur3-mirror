# Contributor: codestation <codestation404@gmail.com>

pkgname=python3-tagpy
pkgver=2013.1
pkgrel=1
pkgdesc="Python3 bindings for TagLib"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/tagpy"
license=('MIT')
depends=('python3' 'taglib' 'boost-libs')
makedepends=('python-distribute' 'boost')
source=("http://pypi.python.org/packages/source/t/tagpy/tagpy-$pkgver.tar.gz")

md5sums=('96cbbd8adb8a6c0b9c21851979cc7c64')

build() {
  cd tagpy-${pkgver}

  # taglib 1.8 still has 1.7.0 version in taglib.h
  sed -i 's/0x10800/0x10700/' src/wrapper/id3.cpp

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python3|" \
    $(find . -name '*.py') 
 
  ./configure.py --taglib-lib-dir=/usr/lib/ \
  	--taglib-inc-dir=/usr/include/taglib/ \
	--boost-inc-dir=/usr/include/boost/ \
	--boost-lib-dir=/usr/lib/ \
	--boost-python-libname=boost_python3
  python3 setup.py build
}

package(){
  cd tagpy-${pkgver}
  python3 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

check(){
  cd tagpy-${pkgver}
  python3 setup.py test
}

# Maintainer: Daniel YC Lin <dlin.tw at gmail>
# Contributor: zorzar <zz at zoranzaric.de>
pkgname=zmqc
pkgver=0.1.0
pkgrel=2
pkgdesc="A small but powerful command-line interface to ØMQ."
url="http://zacharyvoase.github.com/zmqc/"
depends=('python>=2.7' 'python2-pyzmq')
makedepends=('python2-distribute')
license=('(Un)license')
replaces=('python-zmqc')
arch=('any')
source=( py27.patch "git+https://github.com/zacharyvoase/zmqc.git#tag=v$pkgver" )
makedepends=('git')
sha1sums=('9a7d8f2839f1367b3e74222cdad1c0cd0ea99b17'
          'SKIP')

build() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i $srcdir/py27.patch setup.py
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1
}


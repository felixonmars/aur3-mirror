#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=twisted3
pkgver=13.2.0
pkgrel=1
pkgdesc="Asynchronous networking framework written in Python (py3)"
arch=('i686' 'x86_64')
url="http://twistedmatrix.com/"
license=('MIT')
depends=('python-crypto' 'python-zope-interface')
optdepends=('python-pyopenssl'
            'python-pyasn1: for using conch'
            'pygtk: for using manhole'
            'tk: for using tkconch')
install=twisted3.install
source=(http://twistedmatrix.com/Releases/Twisted/${pkgver%.*}/Twisted-$pkgver.tar.bz2)
sha1sums=('e1d43645fd3d84dc2867f36b60d2e469a71eb01d')

prepare() {
    cd "Twisted-$pkgver"
    sed -i 's:^#!.*bin.*python:#!/usr/bin/python3:' \
      twisted/python/test/pullpipe.py \
      twisted/mail/test/pop3testserver.py \
      twisted/trial/test/scripttest.py
}

build() {
    cd "Twisted-$pkgver"
    python3 setup3.py build
}

package() {
    cd "Twisted-$pkgver"
    python3 setup3.py install --prefix=/usr --root="$pkgdir" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

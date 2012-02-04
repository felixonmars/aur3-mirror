# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-twisted
_pkgname=twisted
pkgver=11.1.0
pkgrel=1
pkgdesc="An event-driven networking engine"
arch=('i686' 'x86_64')
url="http://www.twistedmatrix.com/"
license=('MIT')
depends=('python26' 'python26-pycrypto' 'python26-zope-interface')
optdepends=('python26-pyopenssl'
            'python26-soappy:for twisted.web.soap')
source=("http://pypi.python.org/packages/source/T/Twisted/Twisted-$pkgver.tar.bz2")
md5sums=('972f3497e6e19318c741bf2900ffe31c')
install=twisted.install

build() {
	cd "$srcdir/Twisted-$pkgver"
	python26 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python26|' \
		-i "$pkgdir"/usr/lib/python2.6/site-packages/twisted/{trial/test/scripttest.py,mail/test/pop3testserver.py}
	rm -rv "$pkgdir/usr/bin"
}

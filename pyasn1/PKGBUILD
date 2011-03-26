# Contributor: TheGrudge <andi.clemens@gmx.net>
# Contributor: Jesse Young <jesse.young@gmail.com>

pkgname=pyasn1
arch=('any')
pkgver=0.0.12a
pkgrel=1
license=('custom:BSD')
pkgdesc="ASN.1 types and codecs (BER, CER, DER) implementation in Python programming language."
url="http://sourceforge.net/projects/pyasn1/"
depends=('python2' 'setuptools')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ab73da1ea0acf4a510b3f67f2d5a2b6f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir" || return 1
    # install LICENSE
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 

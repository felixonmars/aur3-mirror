# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=python26-pyopenssl
pkgver=0.11
pkgrel=2
pkgdesc="Python2 wrapper module around the OpenSSL library"
arch=('i686' 'x86_64')
url="https://www.launchpad.net/pyopenssl"
license=('LGPL2.1')
depends=('python26' 'openssl')
source=("http://www.launchpad.net/pyopenssl/main/$pkgver/+download/pyOpenSSL-$pkgver.tar.gz")
md5sums=('9e76e57e00fa48745fcfe23944db1e6c')

build() {
 cd "$srcdir/pyOpenSSL-$pkgver"
 python26 setup.py build
}

package() {
 cd "$srcdir/pyOpenSSL-$pkgver"
 python26 setup.py install --root "$pkgdir" --optimize=1
}

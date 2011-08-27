# Contributor: juantascon

pkgname=minifb
pkgver=1.3
pkgrel=1
pkgdesc="Minimal Facebook API for Python"
arch=('any')
url="http://code.google.com/p/minifb/"
license=("MIT")
depends=('python')
source=("http://minifb.googlecode.com/files/minifb-${pkgver}.tar.gz")
md5sums=()

build() {
	install -m644 -D $srcdir/minifb-${pkgver}/minifb.py ${pkgdir}/usr/lib/python3.2/site-packages/minifb.py
}

md5sums=('ea4def7a58759275abf63dab060b14c5')

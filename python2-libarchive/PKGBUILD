# Maintainer: Andy Kluger <gmail: EvilGnome>
pkgname=python2-libarchive
pkgver=3.0.4_5
pkgrel=1
pkgdesc='A libarchive wrapper for Python.'
arch=('i686' 'x86_64')
url="https://code.google.com/p/${pkgname//2/}/"
license=('custom:BSD-3')
depends=('libarchive' 'python2')
source=("https://${pkgname//2/}.googlecode.com/files/${pkgname//2/}-${pkgver//_/-}.tar.gz" 'LICENSE')
md5sums=('075c1f4c22ff2e6bae620f2e7fb0d9ac' 'a270daa2b64f0ada6683a2dcfb4730e5')

build() {
  cd "$srcdir/${pkgname//2/}-${pkgver//_/-}"
  mv setup.py setup.py.original
  sed 's/.12.0.4//' setup.py.original > setup.py
}

package() {
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  cd "$srcdir/${pkgname//2/}-${pkgver//_/-}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
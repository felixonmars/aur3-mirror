# Maintainer: Dwayne Bent <dbb.1@liqd.org>

pkgname=luacrypto
pkgver=0.2.0
pkgrel=2
pkgdesc="Lua frontend to the OpenSSL cryptographic library."
arch=('i686' 'x86_64')
url="http://luacrypto.luaforge.net/"
license=('MIT')
depends=('openssl>=0.9.7' 'lua>=5.1')
source=("http://luaforge.net/frs/download.php/1722/luacrypto-0.2.0.tar.gz"
        'luacrypto.patch')
md5sums=('1e1319d960f0760b113b3e7ad9a3607d'
         '816e4d2c61d1f747bf5d43c813688c92')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    patch -p1 < "$startdir/luacrypto.patch" || return 1
    make DESTDIR=${pkgdir} install || return 1

    install -m644 -D "doc/us/license.html" "$pkgdir/usr/share/licenses/$pkgname/license.html"
}


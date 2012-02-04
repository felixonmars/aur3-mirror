pkgname=hardened-cc
pkgver=4
pkgrel=1
pkgdesc="Wrapper for GCC to reliably build hardened packages. Modified hardening script as used in Ubuntu/Debian"
arch=('any')
license=('unknown')
url='https://wiki.ubuntu.com/Security/HardeningWrapper'
depends=('dash>=0.5.7')
source=('hgcc' "$pkgname.install")
install="$pkgname.install"
sha256sums=('26bf23a1f71900a60e2a15279adacdf01ceba56dfea6638c968d927b751cea79'
            '6218c994a57207369e81e66387e429e087c3f4e658a3e5da620259ffd94e192f')
build() {
	sed "s|gcc|g++|g" "$srcdir/hgcc" > "$srcdir/hg++"
}

package() {
	install -Dm0755 "$srcdir/hgcc" "$pkgdir/usr/bin/hgcc"
	install -Dm0755 "$srcdir/hg++" "$pkgdir/usr/bin/hg++"
}

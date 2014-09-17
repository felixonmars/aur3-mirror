# Maintainer: Matthew Avant <matthew dot avant at gmail dot com>
pkgname=sejda-console-bin
pkgver=1.0.0.M9
pkgrel=2
pkgdesc="A self-contained CLI for PDF editing/manipulation."
url="http://www.sejda.org/download/"
arch=('any')
license=('Apache')
depends=('java-runtime>=5')
source=('https://github.com/torakiki/sejda/releases/download/v1.0.0.M9/sejda-console-1.0.0.M9-bin.zip')
md5sums=('b5da1fe2fbbc9708a2a9f1e2482ead81')

package() {
	install -m 755 -d "$pkgdir"/opt/sejda/{bin,lib,etc,doc/config,doc/examples/xsd} "$pkgdir/usr/bin"
	cp -drn --no-preserve=mode -t "$pkgdir/opt/sejda/" "$srcdir/sejda-console-$pkgver/"*
	echo '/opt/sejda/bin/sejda-console "$@"' > "$pkgdir/usr/bin/sejda-console"
	chmod 755 "$pkgdir/opt/sejda/bin/sejda-console" "$pkgdir/usr/bin/sejda-console"
}

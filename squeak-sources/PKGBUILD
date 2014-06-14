# Maintainer: Matthew Longley <randomticktock@gmail.com>

pkgname='squeak-sources'
pkgver='41'
pkgrel='1'
pkgdesc='Source code file required by Squeak to view function names, source code, etc. within the VM.'
arch=('any')
url='http://www.squeak.org'
license=('Apache')
depends=('squeak-vm=4.10.2.2614-2')
source=("http://ftp.squeak.org/sources_files/SqueakV$pkgver.sources.gz")
md5sums=('53aa6d39ae208e0c230941c29a5ebfbe')

package() {
    mkdir -p "$pkgdir/usr/lib/squeak/4.10.2-2614"
    install -m644 "$srcdir/SqueakV$pkgver.sources" "$pkgdir/usr/lib/squeak/4.10.2-2614/SqueakV$pkgver.sources"
}


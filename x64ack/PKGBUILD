# Maintainer: perlawk

pkgname="x64ack"
pkgver=09.365
_pkgver=09-365
pkgrel=1
pkgdesc="x64ACK is a programmer's toolbox for writing 64bit programs in assembler for SYSV-ABI64/ELF64 conforming operating systems on AMD64/x86_64 hardware."
arch=('x86_64')
license=('GPL')
url="http://nullforth.org/"
source=("http://nullforth.org/releases/$pkgname-$_pkgver.tar.bz2")

package() {
	mkdir -p "$pkgdir"/usr/include/x64ack/
	cp linux-syscall.macro        "$pkgdir"/usr/include/x64ack/
	cp stringdata.macro           "$pkgdir"/usr/include/x64ack/
	cp terminal-control.macro     "$pkgdir"/usr/include/x64ack/
	cp structflow.inc             "$pkgdir"/usr/include/x64ack/
	cp hex64.inc                  "$pkgdir"/usr/include/x64ack/
}
md5sums=('a979350e7d934ff08e0b0221d5ba8571')

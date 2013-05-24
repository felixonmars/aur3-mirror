# Maintainer: Con Tassios <ct@ct.id.au>

pkgname=mboxgrep
pkgver=0.7.9
pkgrel=1
pkgdesc="A utility that scans mailboxes for matching regular expressions"
arch=(i686 x86_64)
url="http://mboxgrep.org"
license=('GPLv2')
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4b256de164b8f094db9ccf0e6386d246')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --infodir=/usr/share/info --mandir=/usr/share/man
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 src/mboxgrep "${pkgdir}"/usr/bin/mboxgrep
  	install -Dm644 doc/mboxgrep.1 "${pkgdir}"/usr/share/man/man1/mboxgrep.1
	install -Dm644 doc/mboxgrep.info "${pkgdir}"/usr/share/info/mboxgrep.info
}

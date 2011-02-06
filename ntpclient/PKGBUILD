# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=ntpclient
pkgver=2010_365
pkgrel=1
pkgdesc='Small NTP (RFC-1305) client for unix-alike computers'
arch=('i686' 'x86_64')
url='http://doolittle.icarus.com/ntpclient/'
# Somewhat more featureful fork:
# http://vmlinux.org/jocke/ntpclient.shtml
license=('GPL')
depends=()
optdepends=('awk: server-rating script')
source=("${url}${pkgname}_${pkgver}.tar.gz")
sha1sums=('105c9fe345ab180ace9d6562861f303180fdc7b0')

build() {
	cd "$srcdir/$pkgname-"*
	export LDFLAGS="-Wl,--hash-style=gnu"
	make USE_OBSOLETE_GETTIMEOFDAY=1 ntpclient
	make USE_OBSOLETE_GETTIMEOFDAY=1 adjtimex
}

package() {
	cd "$srcdir/$pkgname-"*
	install -d "$pkgdir"/usr/{bin,share/{doc/$pkgname,man/man1}}
	install -m755 ntpclient adjtimex "$pkgdir"/usr/bin/
	install -m644 ntpclient.1 adjtimex.1 "$pkgdir"/usr/share/man/man1/
	install -m644 HOWTO README rate.awk rate2.awk "$pkgdir"/usr/share/doc/$pkgname/
}

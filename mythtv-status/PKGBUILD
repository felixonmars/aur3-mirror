# Maintainer: DaCoynul <jonathan.625266@earthlink.net>
# Contributor: twa022 <twa022@gmail.com>

pkgname=mythtv-status
pkgver=0.10.4
pkgrel=3
pkgdesc="Display MythTV status information"
arch=(any)
url="http://www.etc.gen.nz/projects/mythtv/$pkgname.html"
license=('GPL3')
depends=('perl-xml-libxml' 'perl-date-manip' 'perl-libwww' 'perl-mime-tools' 'perl-sys-sigaction' 'perl-config-auto' 'perl-yaml' )
optdepends=('mythtv' 'conky')
makedepends=('git' 'perl')
source=("git+http://git.etc.gen.nz/$pkgname.git")
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/$pkgname"
	git tag | grep -P "^(\d+\\.)?(\d+\\.)?(\\*|\d+)$" | sort -t. -k 1,1n -k 2,2n -k 3,3n | tail -n1
}

package () {
	cd "$srcdir/$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man" install
}

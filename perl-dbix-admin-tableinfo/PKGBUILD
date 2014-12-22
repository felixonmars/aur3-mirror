# Contributor: Chris Clonch <chris at theclonchs dot com>

pkgname=perl-dbix-admin-tableinfo
pkgver=3.00
pkgrel=1
pkgdesc="DBIx::Admin::TableInfo -  A wrapper for all of table_info(), column_info(), *_key_info()"
_dist=DBIx-Admin-TableInfo
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('Artistic2.0')
options=('!emptydirs')
depends=(
         'perl-dbi'
         'perl-data-dumper-concise'
         'perl-moo'
        )
makedepends=(
             'perl-module-build'
             'perl-test-version'
            )
source=("http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/$_dist-$pkgver.tgz")
sha512sums=('71dd10485af2eddcc11ededb1729371bbd89af8e749cb67c76ad104c61fa4ef4de420645c4ccfb4857c71d3f30224638af5348b32cfbf6f9c852b36ae704d908')

build() {
	cd "$srcdir/$_dist-$pkgver"

	perl Build.PL installdirs=vendor destdir="$pkgdir/"
	perl Build
}

check() {
	cd "$srcdir/$_dist-$pkgver"
	perl Build test
}

package() {
	cd "$srcdir/$_dist-$pkgver"
	perl Build install
}

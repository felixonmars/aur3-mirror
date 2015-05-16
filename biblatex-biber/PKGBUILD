# Maintainer: Andreas dot Wagner at em dot uni-frankfurt dot de

pkgname=biblatex-biber
pkgver=2.1
pkgrel=1
pkgdesc="A BibTeX replacement for users of biblatex"
url="http://biblatex-biber.sourceforge.net"
arch=('any')
license=('PerlArtistic')
depends=( \
  'perl-autovivification' \
#  'perl-config-general' \
#  'perl-data-diver' \
#  'perl-par' \
  'perl-data-dump' \
  'perl-data-compare' \
  'perl-date-simple' \
  'perl-file-slurp' \
  'perl-file-slurp-tiny' \
#  'perl-file-slurp-unicode' \
  'perl-ipc-cmd' \
  'perl-ipc-run3' \
  'perl-list-allutils' \
  'perl-mozilla-ca>=20141217' \
  'perl-regexp-common' \
  'perl-log-log4perl' \
  'perl-readonly' \
  'perl-unicode-collate>=1.12' \
  'perl-unicode-normalize<=1.17' \
#  'perl-unicode-gcstring' \
  'perl-encode-eucjpascii' \
  'perl-encode-jis2k' \
  'perl-encode-hanextra' \
  'perl-xml-libxml-simple' \
  'perl-xml-libxslt' \
  'perl-xml-writer' \
#  'perl-xml-writer-string' \
  'perl-libwww' \
  'perl-text-roman' \
  'perl-text-bibtex>=0.70' \
  'perl-lwp-protocol-https' \
  'perl-business-isbn' \
  'perl-business-ismn' \
  'perl-business-issn' \
  'texlive-bibtexextra'
  )

makedepends=( \
	    'perl-config-autoconf' \
	    'perl-extutils-libbuilder' \
)

optdepends=('perl-sleepycat-dbxml: support for Berkeley DBXML databases'
	    'perl-readonly-xs: recommended for speeding up perl-readonly stuff')

conflicts=('biblatex-biber-git')
install=$pkgname.install
source=(http://downloads.sf.net/project/$pkgname/$pkgname/$pkgver/$pkgname.tar.gz)
# source=(http://downloads.sf.net/project/$pkgname/$pkgname/current/$pkgname.tar.gz)

build() {
  cd "${pkgname}-${pkgver}"
  perl Build.PL installdirs=site destdir="$pkgdir/"
  perl Build
}

check() {
  cd "${pkgname}-${pkgver}"
#  perl Build test
}

package() {
  cd "${pkgname}-${pkgver}"
  perl Build install

  mkdir -p "$pkgdir/usr/local/bin"
  mv "$pkgdir/usr/bin/site_perl/biber" "$pkgdir/usr/local/bin/biber"
  rm -rf "$pkgdir/usr/bin"

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

md5sums=('c46979acce3befdb3431ffadcc81bdf3')

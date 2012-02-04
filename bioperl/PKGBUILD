# Maintainer: Michael Schubert <mschu at gmail>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=bioperl
pkgver=1.6.901
pkgrel=1
pkgdesc='Perl modules for bioinformatics applications.'
arch=('any')
license=('GPL' 'PerlArtistic')
url='http://www.bioperl.org'
depends=('perl-io-string')
makedepends=('perl-data-stag')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/C/CJ/CJFIELDS/BioPerl-$pkgver.tar.gz")
md5sums=('bd7a763539e9f874a495e0ebe15422a3')

build() {
  cd "$srcdir/BioPerl-$pkgver"

  # install module in vendor directories.
  perl Build.PL < /dev/null # non-interactive, uses defaults

  ./Build
}

package() {
  cd "$srcdir/BioPerl-$pkgver"

  ./Build install \
    --install_base /usr \
    --install_path lib=/usr/share/perl5/vendor_perl \
    --install_path bindoc=/usr/share/man/man1 \
    --install_path libdoc=/usr/share/man/man3 \
    --destdir "$pkgdir"

  # remove .pl extensions from binaries
  cd "$pkgdir/usr/bin"
  for b in * ; do
    mv ${b} $(basename $b .pl)

    if [ -e "$pkgdir/usr/share/man/man1/${b}.1p" ] ; then
      mv "$pkgdir/usr/share/man/man1/${b}.1p" \
        "$pkgdir/usr/share/man/man1/$(basename ${b} .pl).1p"
    fi
  done

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

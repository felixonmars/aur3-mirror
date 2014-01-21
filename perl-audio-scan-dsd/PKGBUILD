# Contributor:	Moritz Bunkus <moritz@bunkus.org>
# Maintainer:	Frank Phillips <frankalso@gmail.com>

pkgname='perl-audio-scan-dsd'
pkgver='0.93'
pkgrel='1'
pkgdesc="Fast C metadata and tag reader for all common audio file formats, includes DSF/DFF"
arch=('i686' 'x86_64' 'armv6h')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'zlib>=1.2.5' 'perl-file-slurp')
makedepends=('perl-test-warn')
provides=('perl-audio-scan')
conflicts=('perl-audio-scan')
url='https://github.com/CommunitySqueeze/Audio-Scan'
source=('git+https://github.com/CommunitySqueeze/Audio-Scan.git')
md5sums=('SKIP')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Audio-Scan"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

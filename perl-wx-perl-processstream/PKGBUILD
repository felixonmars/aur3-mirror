# Maintainer : Netanel Shine <netanel at archlinux.org.il>
# Contributor: Eliran Gonen <eliran.gonen at gmail.com>
pkgname=perl-wx-perl-processstream
_realname=Wx-Perl-ProcessStream
pkgver=0.32
pkgrel=1
pkgdesc="access IO of external processes via events
"
arch=(i686 x86_64)
license=('~
')
url="http://search.cpan.org/~mdootson/Wx-Perl-ProcessStream"
options=(!emptydirs)

depends=('perl-wx' 'perl')

#provides=('Wx-Perl-ProcessStream')
provides=('wx-perl-processstream=${pkgver}' 'Wx::Perl::ProcessStream=${pkgver}' 'perl-wx-perl-processstream=${pkgver}')

source=(http://search.cpan.org/CPAN/authors/id/M/MD/MDOOTSON/${_realname}-${pkgver}.tar.gz)
md5sums=('037cb3e443cb510a89bba928fb676e29')

build() {
  _expected_dir="${srcdir}/${_realname}-${pkgver}"
  if [ -d "$_expected_dir" ]; then
    cd "$_expected_dir"
  else
    _expected_dir="${srcdir}/$(bsdtar -t -f $(basename $source) | head -n1)"
    if [ -d "$_expected_dir" ]; then
      cd "$_expected_dir"
    else
      _makefile=$(find $srcdir -iname Makefile.PL)
      if [ ! -z "$_makefile" ]; then
        _expected_dir=$(dirname $_makefile)
        if [ -d "$_expected_dir" ]; then
          cd "$_expected_dir"
        else
          echo "[1;31mERROR[0m unable to detect source directory"
          echo "[1;34m-->[0m this is often due to CPAN's lack of standard naming conventions"
          echo "[1;34m-->[0m it may be possible to fix this by adjusting the build function in the PKGBUILD"
        fi
      fi
    fi
  fi
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}

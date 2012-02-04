pkgname=perl-math-matrixreal
_realname=Math-MatrixReal
pkgver=2.05
pkgrel=1
pkgdesc="Matrix of Reals in Perl"
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/dist/Math-MatrixReal/"
options=(!emptydirs)

depends=('perl')

provides=('math-matrixreal=2.05' 'Math::MatrixReal=2.05' 'perl-math-matrixreal=2.05')

source=(http://search.cpan.org/CPAN/authors/id/L/LE/LETO/Math-MatrixReal-2.05.tar.gz)

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
md5sums=('67f23122424830b5eea044f987b892b9')

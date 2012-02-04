# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=perl-lchown
pkgver=1.01
pkgrel=1
pkgdesc="A perl interface to the lchown(2) UNIX system call"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Lchown/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.1')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/N/NC/NCLEATON/Lchown-${pkgver}.tar.gz)
md5sums=('e3db31be650437eb5d9bfc4da6252ee3')

build() {
  cd "${srcdir}/Lchown-${pkgver}"

  perl Build.PL installdirs=vendor destdir="${pkgdir}/"
  perl Build
  perl Build install

  # remove perllocal.pod and .packlist
  find "${pkgdir}" -name perllocal.pod -delete
  find "${pkgdir}" -name .packlist -delete
}

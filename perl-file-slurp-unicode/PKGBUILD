# Contributor: Andreas dot Wagner at em dot uni-frankfurt dot de

pkgname=perl-file-slurp-unicode
_cpanname=File-Slurp-Unicode
pkgver=0.7.1
pkgrel=2
pkgdesc="Reading/Writing of Complete Files with Unicode Support"
arch=('any')
url="http://search.cpan.org/dist/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-file-slurp')
options=('!emptydirs')
source=(http://ftp.fi.debian.org/gentoo/distfiles/${_cpanname}-${pkgver}.tar.gz) 

build() {
  cd $srcdir/${_cpanname}-${pkgver}
  perl Build.PL installdirs=vendor destdir=$pkgdir
  perl Build
}


package() {
  cd $srcdir/${_cpanname}-${pkgver}
  perl Build install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}

md5sums=('8ebcc97e4ed0516b176dea7630936d5d')

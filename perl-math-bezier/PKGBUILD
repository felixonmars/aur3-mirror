# Maintainer: Adam Eberlin <ae at adameberlin dot com>

pkgname=perl-math-bezier
pkgver=0.01
pkgrel=1
pkgdesc="This module implements the algorithm for the solution of Bezier curves."
arch=('i686' 'x86_64')
url="http://mkweb.bcgsc.ca/schemaball/"
license=('Public Domain')
depends=("rpmextract")
makedepends=()
provides=("perl-math-bezier=$pkgver")
replaces=()
conflicts=()
options=('!libtool')
source=("http://dag.wieers.com/rpm/packages/perl-Math-Bezier/perl-Math-Bezier-${pkgver}-${pkgrel}.rf.src.rpm")
md5sums=('9bca6d5c2f193459b215bab5bccd5df3')

build()
{
  cd ${srcdir}
  rpmextract.sh perl-Math-Bezier-${pkgver}-${pkgrel}.rf.src.rpm
  tar xvf Math-Bezier-${pkgver}.tar.gz

	cd ${srcdir}/Math-Bezier-${pkgver}

	msg "Starting make..."

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${pkgdir} || return 1
}

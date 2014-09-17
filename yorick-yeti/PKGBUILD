# Maintainer: Francois Rigaut <frigaut at gmail dot com>

pkgname=yorick-yeti
_pkgshonam=yeti
pkgver=6.3.3
pkgrel=1
pkgdesc="A yorick extension for TIFF, FFTW2, GSL, regex, etc..."
arch=('i686' 'x86_64')
license=('GPL')
url="http://cral.univ-lyon1.fr/labo/perso/eric.thiebaut/yeti.html"
groups=('science' 'yorick-all')
depends=('yorick' 'gsl' 'fftw2' 'libtiff')
makedepends=('yorick')
source=(http://cral.univ-lyon1.fr/labo/perso/eric.thiebaut/downloads/yorick/${_pkgshonam}-${pkgver}.tar.bz2)
md5sums=('96afd824233616a8f246427a72e2d98e')

build() {
  cd ${srcdir}/${_pkgshonam}-${pkgver}
  yorick -batch make.i
  yorick -batch ./config.i --with-tiff=yes --with-gsl=yes --with-fftw=no --with-regex=yes || return 1
  make all || return 1
  # get yorick version for path
  echo 's=sum(strtok(Y_VERSION,".",3)(1)+"."+strtok(Y_VERSION,".",3)(2))' > /tmp/get_yversion
  echo 'f=open("/tmp/yversion","w"); write,f,format="%s",s; close,f;' >> /tmp/get_yversion
  yorick -batch /tmp/get_yversion
  yversion=`cat /tmp/yversion`
  mkdir -p ${pkgdir}/usr/share/yorick/${yversion}/doc
  make DESTDIR=${pkgdir} DOCDIR=${pkgdir}/usr/share/yorick/${yversion}/doc install || return 1
}

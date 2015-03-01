# Contributor: Ricardo Honorato
_srcname="sundials"
pkgname=octave-sundials
pkgver=2.5.0
pkgrel=1
pkgdesc="SUNDIALS bindings for Octave"
arch=('i686' 'x86_64')
url="https://computation.llnl.gov/casc/sundials/main.html"
license=('BSD')
depends=(octave)
source=("http://ftp.mcs.anl.gov/pub/petsc/externalpackages/$_srcname-$pkgver.tar.gz"
        "octave-sundialstb.patch") # taken from Debian
install="octave-sundials.install"

build() {
  cd "$srcdir"
  patch -p0 < octave-sundialstb.patch
  cd "$_srcname-$pkgver/sundialsTB"
  mkdir octave
  octave -fV install_STB.m
  strip octave/sundialsTB/cvodes/cvm/cvm.mex
  strip octave/sundialsTB/idas/idm/idm.mex
  strip octave/sundialsTB/kinsol/kim/kim.mex
}

package() {
  cd "$srcdir/$_srcname-$pkgver/sundialsTB/octave"
  bpath=`octave-config -p ARCHLIBDIR`
  mkdir -p "${pkgdir}${bpath}/sundialsTB/cvodes/cvm"
  mv sundialsTB/cvodes/cvm/cvm.mex "${pkgdir}${bpath}/sundialsTB/cvodes/cvm/"
  mkdir -p "${pkgdir}${bpath}/sundialsTB/idas/idm"
  mv sundialsTB/idas/idm/idm.mex "${pkgdir}${bpath}/sundialsTB/idas/idm/"
  mkdir -p "${pkgdir}${bpath}/sundialsTB/kinsol/kim"
  mv sundialsTB/kinsol/kim/kim.mex "${pkgdir}${bpath}/sundialsTB/kinsol/kim/"
  mpath=`octave-config -p FCNFILEDIR`
  mkdir -p "${pkgdir}${mpath}"
  mv * "${pkgdir}${mpath}"
}

md5sums=('aba8b56eec600de3109cfb967aa3ba0f'
         '3d53d54e1f6bd74d41d72b174cdd7e55')

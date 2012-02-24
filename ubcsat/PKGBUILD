# Maintainer: Yi Dai <plmday_at_gmail_dot_com>
# Contributor: Arthur Danskin <arthurdanskin@gmail.com>

pkgname=ubcsat
pkgver=1.1.0
pkgrel=1
pkgdesc="The Stochastic Local Search SAT Solver from the University of British Columbia BETA-Lab"
url="http://www.satlib.org/ubcsat/"
license=('custom')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('gcc')
source=('http://www.satlib.org/ubcsat/archive/ubcsat-1-1-0.tar.gz')
md5sums=('f962732fdf882246024dcd6ae339d5ce')

build() {
  cd "${srcdir}"

  rm -f ubcsat ubcsat.exe
  make all
}

package() {
  cd "${srcdir}"

  install -D -m755 ubcsat "${pkgdir}/usr/bin/ubcsat"
  install -D -m644 legal.txt "${pkgdir}/usr/share/licenses/ubcsat/legal.txt"
}


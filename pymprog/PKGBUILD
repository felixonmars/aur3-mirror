# Contributor: Robert Schwarz <mail@rschwarz.net>
pkgname=pymprog
_dlname=pympl # src archive changed name, but sf project name was kept
pkgver=4.2
pkgrel=1
pkgdesc="Python implementation of AMPL and GNU MathProg, connecting to GLPK."
arch=("i686" "x86_64")
url="http://pymprog.sourceforge.net/"
license=('GPL')
depends=(python)
provides=(pyglpk)
conflicts=(pyglpk)
source=(http://switch.dl.sourceforge.net/sourceforge/pymprog/$_dlname.$pkgver.tgz)
md5sums=('737cdf89d652cb9e45be65bc0ec3dc85')

build() {
  cd "$srcdir/"
  python setup.py install --root "${pkgdir}" || return 1
}

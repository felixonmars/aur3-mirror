
# Contributor: Giulio Guzzinati <skarn86junk@gmail.com>
pkgname=gettransitions
pkgver=20070610
pkgrel=1
pkgdesc="a script to use beamer with impress!ve, and specify transitions inside the .tex file"
arch=('any')
url="http://www.cv.nrao.edu/~rreid/software/#gettransitions"
license=('GPLv2')
groups=()
depends=(perl)
makedepends=()
optdepends=(impressive texlive-core)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(gettransitions)
noextract=(gettransitions)
md5sums=('fea4ad26764133ca4f9eb7e69ffd5dcc')

build() {
  chmod +x gettransitions
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp gettransitions $pkgdir/usr/bin/gettransitions
}

# vim:set ts=2 sw=2 et:

# Maintainer: Srijan Choudhary <srijan4@gmail.com>
pkgname=rtm-cli
pkgver=1.3.1
pkgrel=1
pkgdesc="A python-based command line interface for Remember the Milk"
arch=(any)
url="http://www.davidwaring.net/projects/rtm.html"
license=('GPL')
depends=(python-pyrtm)
source=(https://bitbucket.org/dwaring87/${pkgname}/get/${pkgver}.tar.gz)
md5sums=('564ef93b6ca0c113c93c464f178cbd25')
_revision=c5001a009229

package() {
  cd "$srcdir/dwaring87-rtm-cli-$_revision"
  install -D rtm "${pkgdir}/usr/bin/rtm"
}

# vim:set ts=2 sw=2 et:

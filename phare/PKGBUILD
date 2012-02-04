# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=phare
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A rc wrapper for the simple Python HTTP server."
arch=('any')
url="http://docs.python.org/library/simplehttpserver.html"
license=('PSF')
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='proto.install'
changelog=
source=(phare.rc)
noextract=()
md5sums=('18524cccc67e8d0917729920235cff7b')

build() {
    mkdir -p $pkgdir/etc/rc.d
    mkdir -p $pkgdir/srv/phare
}

package() {
  cp phare.rc $pkgdir/etc/rc.d/phare
  chmod +x $pkgdir/etc/rc.d/phare
}

# vim:set ts=2 sw=2 et:

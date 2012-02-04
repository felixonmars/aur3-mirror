# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=rocksndiamonds-fedora
pkgver=3.3.0.1
_pkgrel=3
pkgrel=1
pkgdesc="Arcade style game in the tradition of Boulder Dash.  Fedora version."
arch=('i686' 'x86_64')
url="https://admin.fedoraproject.org/pkgdb/acls/name/rocksndiamonds"
license=('GPL')
depends=('sdl_mixer' 'sdl_net' 'sdl_image' 'gcc-libs')
makedepends=('rpmextract')
conflicts=('rocksndiamonds')
replaces=('rocksndiamonds-fedora-32' 'rocksndiamonds-fedora-64')
if [ "$CARCH" = "x86_64" ]; then
	source=(http://kojipkgs.fedoraproject.org/packages/rocksndiamonds/${pkgver}/3.fc16/x86_64/rocksndiamonds-${pkgver}-${_pkgrel}.fc16.x86_64.rpm)
	md5sums=('dde55d447008d5d66fa427653707a4c3')
else
	source=(http://kojipkgs.fedoraproject.org/packages/rocksndiamonds/${pkgver}/3.fc16/i686/rocksndiamonds-${pkgver}-${_pkgrel}.fc16.i686.rpm)
	md5sums=('d373598ebe113e2c2ef61072a17dbbf4')
fi
build() {
  [ "$CARCH" = "i686" ] && rpmextract.sh $srcdir/rocksndiamonds-${pkgver}-${_pkgrel}.fc16.i686.rpm
  [ "$CARCH" = "x86_64" ] && rpmextract.sh $srcdir/rocksndiamonds-${pkgver}-${_pkgrel}.fc16.x86_64.rpm
  cp -R $srcdir/usr $pkgdir
}


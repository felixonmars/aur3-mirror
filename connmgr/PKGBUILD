# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=connmgr
pkgver=1.0.0
pkgrel=1
pkgdesc="A connection manager for ssh, sftp, ftp and many more connections"
arch=(i686)
url="http://sshmgr.sourceforge.net"
license=('GPL')
groups=()
depends=(perl perl-appconfig)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://prdownloads.sourceforge.net/sourceforge/sshmgr/${pkgname}_${pkgver}-1.tar.gz Makefile.patch)
noextract=()
md5sums=('b3d4fff938723ada86e66a5b58372595'
         '1c0ab8ac172fb69779318d1936b80755')


build() {
  cd "$startdir/src/$pkgname-$pkgver"

  patch < $startdir/Makefile.patch
  make clean 
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:

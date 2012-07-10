# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <cheesinglee AT gmail D0T com>
pkgname=gal3upload
pkgver=2012.05.14
pkgrel=1
epoch=
pkgdesc="An uploader for Gallery3 written in Go"
arch=('any')
url="http://code.google.com/p/gal3upload/"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://gal3upload.googlecode.com/files/$pkgname\_$pkgver.tar.gz)
noextract=()
md5sums=('4e4ccfdb1d20f5f73fd3200305992a5e')


package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  cp gal3upload "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:

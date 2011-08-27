# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=buildconf
pkgver=2009.12.23
pkgrel=1
pkgdesc="A little build preparation script"
arch=(i686 x86_64 arm)
url="http://buildconf.brlcad.org/"
license=('BSD')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(http://downloads.sourceforge.net/project/buildconf/autogen/${pkgver}/$pkgname.$pkgver.tar.gz)

build() {
  echo Nothing to build...
}

package() {
  cd "$srcdir/$pkgname"
  install -D -T autogen.sh $pkgdir/usr/bin/buildconf
}

# vim:set ts=2 sw=2 et:
md5sums=('a70be9fe0d52c393592f218e8b1aa020')

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <meyer.thibault@hotmail.fr>
pkgname=pam_redis
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="Redis authentication PAM module"
arch=('i486' 'i686' 'x86_64' 'sparc')
url="https://github.com/corbeau-web/pam_redis"
license=('GPL')
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
source=('https://github.com/downloads/corbeau-web/pam_redis/pam_redis-0.2.tar.gz')
md5sums=('5f9d979435d24a0ae7eeb9ea71fd2491')
noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

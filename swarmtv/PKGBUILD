# Maintainer: Juho Rutila <juho.rutila@gmail.com>
pkgname=swarmtv
pkgver=0.9.2
pkgrel=1
epoch=
pkgdesc="SwarmTv is a broadcatching tool with a stable commandline interface. "
arch=('x86_64')
url="http://swarmtv.nl/"
license=('GPLv3')
groups=()
depends=(sqlite3 pcre curl libxml2 libesmtp)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=swarmtv.install
changelog=
source=(http://swarmtv.nl/download/$pkgname-$pkgver.tar.gz
databaseimpl-rsst_dir.diff
swarmtv.install
swarmtv.rc
)
noextract=()
md5sums=('09c28b519e7a56c9eef8a99924b83255'
         'af08bbc15bd2da68bc849bbd4ede7d43'
         'd5c38b38ecf3f5ef7f4d4b02045253e9'
         '10d0aba6693004b61effeed9ef9633bc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -uN libswarmtv/databaseimpl.h ../databaseimpl-rsst_dir.diff || return 1
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make swarmtv
}

package() {
  install -Dm755 swarmtv.rc $pkgdir/etc/rc.d/swarmtv
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/var/lib/swarmtv
}

# vim:set ts=2 sw=2 et:

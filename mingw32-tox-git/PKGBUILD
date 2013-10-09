# Maintainer: naxuroqa <naxuroqa@gmail.com>
pkgname=mingw32-tox-git
_gitname=ProjectTox-Core
pkgver=1577.4aa507b
pkgrel=1
pkgdesc="A FOSS instant messaging application aimed to replace Skype (mingw32)"
arch=('any')
url="https://github.com/irungentoo/ProjectTox-Core"
license=('GPL3')
makedepends=('mingw32-gcc' 'mingw32-pkg-config' 'git')
depends=('mingw32-runtime' 'mingw32-libsodium')
options=('!strip' '!buildflags' '!libtool' '!makeflags')
provides=('mingw32-tox')
conflicts=('mingw32-tox')
source=("git://github.com/irungentoo/ProjectTox-Core.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"

  unset LDFLAGS
  autoreconf -fi 
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --disable-testing # for now
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}

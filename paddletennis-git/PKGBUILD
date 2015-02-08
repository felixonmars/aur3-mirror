# Maintainer: Roger Bassons "rogertux" <rogerbassons@gmail.com>
pkgname=paddletennis-git
pkgver=19
pkgrel=1
epoch=
pkgdesc="Simple Pong clone"
arch=(any)
url="https://github.com/rogertux/PaddleTennis"
license=('GPL3')
groups=()
depends=('git' 'sdl2' 'gcc' 'make')
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
source=(paddletennis::git+https://github.com/rogertux/PaddleTennis/)
noextract=()

package() {
  cd paddletennis
  make
  mkdir -p $pkgdir/usr/bin
  chmod 755 PaddleTennis	
  cp  PaddleTennis $pkgdir/usr/bin/paddletennis
 }


pkgver() {
  cd paddletennis
  echo $(git rev-list --count master)
}

md5sums=('SKIP')
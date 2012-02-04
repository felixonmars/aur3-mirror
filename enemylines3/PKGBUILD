pkgname=enemylines3
pkgver=1.2
pkgrel=1
pkgdesc="Semi-abstract first person 3d-shooter game."
arch=('i686' 'x86_64')
url="http://proj.phk.at/el/3/"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'sdl_ttf' 'curl')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://proj.phk.at/el/3/$pkgname-$pkgver.tar.bz2
        enemylines_gcc43.patch)
noextract=()
md5sums=('aa9538749df25bc967195fefe1439791'
         'd35dfc6f66bbed7d0c936da15b945d64')

build() {
  cd "$srcdir"
  patch -p0 -i enemylines_gcc43.patch || return 1
  cd "$pkgname-$pkgver"
  make || return 1
  make DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:

# Maintainer: Papajoker <papajoker [at] archlinux [dot] info>
pkgname=screen-manja
pkgver=0.1.0
pkgrel=2
pkgdesc="Fetches system/theme information in terminal for Linux Manjaro"
arch=('any')
url="https://github.com/papajoker/scren-manja"
license=('GPL')
groups=()
depends=('xorg-xdpyinfo' 'screenfetch>=3.6')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+http://github.com/papajoker/scren-manja#branch=master")
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

build() {
  cd "$srcdir"
  msg "Starting build..."
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ./${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm744 ./etc/${pkgname}/items.conf ${pkgdir}/etc/${pkgname}/items.conf
  cp -r ./usr/ "${pkgdir}/"
}

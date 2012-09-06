# Maintainer: wolffffelix at removethis googlemail dot com
pkgname=nsc-client-tools
pkgver=8
pkgrel=1
epoch=
pkgdesc="Tools that allow you to have a self-updating network-shared pacman cache. Scripts for the client side"
arch=('any')
url="https://github.com/n0stradamus/nsc-tools"
license=('GPL')
groups=()
depends=('inetutils' 'coreutils' 'openssh' 'pacman' 'sed')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/n0stradamus/nsc-tools/tarball/v8")
noextract=()
md5sums=('c93cebdac3d1b4dcd59b2a69838f6a34')


build() {
  cd "$srcdir"
  mv n0stradamus-nsc-tools-* nsc-tools
}

package() {
  cd "$srcdir/nsc-tools/client"
  PREFIX="$pkgdir" ./install.sh
}

# vim:set ts=2 sw=2 et:

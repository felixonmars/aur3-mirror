# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=roy-git
pkgver=v0.2.2.44.gfa63f3b
pkgrel=1
pkgdesc="Small functional language that compiles to JavaScript."
arch=('any')
url="http://roy.brianmckenna.org/"
license=('custom:BSDish')
depends=('nodejs')
makedepends=('git')
provides=('roy')
conflicts=('roy')

source=("git://github.com/puffnfresh/roy.git")
md5sums=('SKIP')

pkgver() {
  cd roy
  local ver="$(git describe --long)"
  echo "${ver//-/.}"
}

prepare() {
  cd roy
  sed -ie "2s|./src|/usr/lib/node_modules/roy/src|" roy
}

build() {
  cd roy
  make deps
  make
}

check() {
  cd roy
  make test
}

package() {
  cd roy
  local _npmdir="$pkgdir/usr/lib/node_modules/roy"
  for x in package.json src/* lib/* ;do
    install -D -m644 $x "$_npmdir/$x"
  done
  npm prune --production
  cp -dpr --no-preserve=ownership node_modules "$_npmdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/roy/LICENSE"
  install -D -m755 roy "$pkgdir/usr/bin/roy"
} 

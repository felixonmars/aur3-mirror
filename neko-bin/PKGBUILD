# Contributor: Maximilian Ruta <mr@xtain.net>
# Maintainer: Maximilian Ruta <mr@xtain.net>

pkgname=neko-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="High-level language which can also be used as an embedded scripting language"
url="http://nekovm.org/"
license=('GPL')
arch=("i686" "x86_64")
options=(!strip)
depends=("apache" "gc" "gtk2" "libmariadbclient" "sqlite")

[[ "$CARCH" = "i686" ]]   && _platform="linux"
[[ "$CARCH" = "x86_64" ]] && _platform="linux64"

makedepends=()
conflicts=(neko-svn neko)

replaces=("neko")
provides=("neko=$pkgver.$pkgrel")
source=(
  "http://nekovm.org/_media/neko-${pkgver}-${_platform}.tar.gz"
)

[[ "$CARCH" = "i686" ]] && sha256sums=("822ef770761bbb6a3bfd9b52e36420ec25d1bc133a4d2cdbfa8865601cc21b22")
[[ "$CARCH" = "x86_64" ]] && sha256sums=("0ee747482458b4fc755fa2d3feb516db709b32309b5eaf59a80d4470cd71647b")

build() {
  cd $srcdir
}

package() {
  _realsrcdir="$srcdir/neko-${pkgver}-linux"
  cd $pkgdir
  mkdir -p usr/bin
  for _file in nekoc nekoml nekotools neko; do
    cp $_realsrcdir/$_file usr/bin/$_file
  done
  mkdir -p usr/lib/neko
  for _file in $_realsrcdir/*.ndll; do
    _targetfile=$(basename "$_file")
    cp $_file usr/lib/neko/$_targetfile
  done
  for _file in $_realsrcdir/*.so; do
    _targetfile=$(basename "$_file")
    cp $_file usr/lib/$_targetfile
  done
  cp -r $_realsrcdir/include usr/
}
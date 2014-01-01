# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

_pack=io
pkgname=octave-$_pack-unstable
pkgver=1.3.2
_file_id=28441
pkgrel=1
pkgdesc="Input/Output in external formats. (test version for octave >3.7.2)"
provides=('octave-io=1.3.2')
conflicts=('octave-io')
arch=(any)
url="http://savannah.gnu.org/patch/?8099"
license=('custom')
depends=('octave>=3.7.2')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
noextract=("$_archive")

source=("$_archive::https://savannah.gnu.org/file/$_archive?file_id=$_file_id")
md5sums=('1aa491de9e5d81b0161ee5b918256f84')
sha512sums=('271d3dd27db0fc28a01b486b2a0d9d6976f5e7e54e36a3bcf6964cfd40f47a3474f05b575a9bab02bf821b15ccc3a8ad9fb5bab1157d9983e05f020d5613d7af')

build() {
  cd "$srcdir"
  mkdir -p builddir
  octave -q -f --eval "pkg build -verbose -nodeps builddir $_archive"
}

package() {
  mkdir -p "$pkgdir/usr/share/octave/packages"
  mkdir -p "$pkgdir/usr/lib/octave/packages"
  cp "$srcdir/builddir/$_archive" "$pkgdir/usr/share/octave/$_pack.tar.gz"
}

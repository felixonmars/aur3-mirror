# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Maintainer: Robert Orzanna <orschiro at gmail dot com>

pkgname=timeshift-bin
pkgver=1.2
pkgrel=1
pkgdesc="A system restore utility for Linux"
arch=('i686' 'x86_64')
url="http://teejeetech.blogspot.nl/p/timeshift.html"
license=('GPL')
depends=('gtk3' 'rsync' 'libgee06' 'libsoup' 'json-glib')
optdepends=('gksu: run timeshift from a menu')
options=('!emptydirs')
if [[ "$CARCH" == "i686" ]]; then
  _arch='i386'
  sha256sums=('339b4939cb6e3f8d0a00d6f4580ec98b75d12f1e6dee48ef8e1d0e1cb9235dd2')
elif [[ "$CARCH" == "x86_64" ]]; then
  _arch='amd64'
  sha256sums=('0d4dc153cf2f242c43518fb0854189454c0a21be6e5cd0c0ff2c7181f9f90961')
fi
source=("http://dl.dropbox.com/u/67740416/linux/timeshift-latest-$_arch.run")

package() {
  cd "$srcdir"

  sh ./timeshift-latest-$_arch.run --target "$pkgdir" --noexec
  rm "$pkgdir/install.sh"
}
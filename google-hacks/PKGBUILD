pkgname=google-hacks
pkgver=0.1
pkgrel=1
pkgdesc="some google hacks to find things like audio, movies and ebooks - should work out of the box on archlinux"
arch=(i686)
url="http://aur.archlinux.org"
license=('GPL')
groups=()
depends=('links' 'bash')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
source=($pkgname.tar.gz)
md5sums=('7e9086e16bbf59835168a39437618c99')

build() {
  cd "$startdir/src/$pkgname"

install -d $startdir/pkg/usr/bin
install $startdir/src/google-hacks/google_hacks $startdir/pkg/usr/bin/google_hacks

}

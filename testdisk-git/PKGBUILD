# Maintainer: Niklas Hedlund <nojan1989@gmail.com>
pkgname=testdisk-git
pkgver=r1508.ce2dc76
pkgrel=1
pkgdesc="Testdisk and Photorec from CGSecurity"
url="http://www.cgsecurity.org/wiki/TestDisk"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('zlib' 'ncurses' 'e2fsprogs' 'libjpeg' 'ntfsprogs' 'progsreiserfs')
optdepends=()
makedepends=('autoconf' 'git')
conflicts=(testdisk)
source=('git+http://git.cgsecurity.org/testdisk.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/testdisk"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/testdisk"

  touch ChangeLog
  [ ! -d config ] && mkdir config

  autoreconf --install -W all -I config
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/testdisk"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

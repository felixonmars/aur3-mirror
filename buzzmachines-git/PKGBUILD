# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=buzzmachines-git
pkgver=r178.0d74cbc
pkgrel=1
pkgdesc="Collection of freely available buzz machine sources for Buzztrax (former Buzztard)"
arch=('i686' 'x86_64')
url="http://www.buzztrax.org"
license=('LGPL')
makedepends=('git')
provides=('buzzmachines')
conflicts=('buzzmachines' 'buzzmachines-svn')
replaces=('buzzmachines-svn')
source=("$pkgname::git+https://github.com/Buzztrax/buzzmachines.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}

# $Id: PKGBUILD 108142 2014-03-23 19:44:44Z idevolder $
# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=libnfs-git
pkgver=1.9.3.r43.g8a52596
pkgrel=1
pkgdesc="client library for accessing NFS shares, git version"
arch=('i686' 'x86_64')
url="https://github.com/sahlberg/libnfs"
license=('GPL')
depends=('glibc')
conflicts=('libnfs')
provides=('libnfs')
source=("$pkgname::git+https://github.com/sahlberg/libnfs.git")
sha256sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --long | sed -r 's/^[^-]*-([^-]*-)([^-]*-g)/\1r\2/;s/-/./g'
}

build() {
  cd "$pkgname"

  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

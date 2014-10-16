# Maintener: Alexey Dubinin <DubininAlexey at gmail dot com>
_pkgrealname='fuse-7z-ng'
pkgname="$_pkgrealname-git"
pkgver=20140608
pkgrel=1
pkgdesc="FUSE read-only file system for 7zip, zip and other archive types"
arch=('i686' 'x86_64')
url="https://github.com/kedazo/fuse-7z-ng"
license=('GPL')
provides=('fuse-7z')
conflicts=('fuse-7z')
depends=('fuse')
makedepends=('git' 'make')
source=("$pkgname::git+https://github.com/kedazo/fuse-7z-ng.git" 'cerr.patch')
md5sums=('SKIP' 'f4cb7619aa38223c827e5361714edf5d')

pkgver() {
  cd $pkgname
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}
build() {
  cd $pkgname
  patch -p 1 < "$srcdir/cerr.patch"
  ./autogen.sh && ./configure --prefix=/usr && make
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr MANPREFIX=/usr/share/man install
  mv "$pkgdir/usr/bin/fuse-7z-ng" "$pkgdir/usr/bin/fuse-7z"
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$_pkgrealname/COPYING"
}

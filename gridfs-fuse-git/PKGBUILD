# Maintainer: Vadym Abramchuk <abramm@gmail.com>
pkgname=gridfs-fuse-git
pkgver=20120812
pkgrel=1
pkgdesc="A FUSE module for mongodb's GridFS clustering file system"
arch=('i686', 'x86_64')
url="https://github.com/mikejs/gridfs-fuse"
license=('GPL3')
groups=()
depends=('mongodb' 'fuse' 'boost-libs')
makedepends=('git' 'boost')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('fix-build.patch')
noextract=()
md5sums=('4eba7616b91bb546fa4ef17e1adbca38')

_gitroot=git://github.com/mikejs/gridfs-fuse.git
_gitname=gridfs-fuse

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  patch -p1 < "$srcdir/fix-build.patch"

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D mount_gridfs $pkgdir/usr/bin/mount_gridfs
}

# vim:set ts=2 sw=2 et:


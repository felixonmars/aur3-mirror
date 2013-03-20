# Contributor: Cravix < dr dot neemous at gmail dot com >

pkgname=deadbeef-plugins-vfsrar-git
pkgver=20120213
pkgrel=3
pkgdesc="VFS-RAR plugin for deadbeef to read from rar archive"
arch=('i686' 'x86_64')
url="https://github.com/shaohao/vfs_rar"
license=('GPL')
depends=('deadbeef')
makedepends=('git')
source=(http://www.rarlab.com/rar/unrarsrc-4.2.4.tar.gz)
md5sums=('8ea9d1b4139474b282d76e627a2de3e4')
noextract=(unrarsrc-4.2.4.tar.gz)
_gitroot="git://github.com/shaohao/vfs_rar.git"
_gitname="vfs_rar"

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
  
  tar -xvf "$srcdir/unrarsrc-4.2.4.tar.gz"

	make
}
package() {
	mkdir -p "${pkgdir}/usr/lib/deadbeef"
	cp "$srcdir/$_gitname-build/$_gitname.so" "${pkgdir}/usr/lib/deadbeef/"
}

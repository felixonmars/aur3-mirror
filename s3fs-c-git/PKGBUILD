pkgname=s3fs-c-git
pkgver=20130405
pkgrel=1
pkgdesc="Fork of s3fs compatible with other clients"
arch=('i686' 'x86_64')
url="https://github.com/tongwang/s3fs-c"
license=('GPL2')
depends=('fuse' 'glib2' 'libxml++')
makedepends=('git')
conflicts=('s3fs')
provides=('s3fs')

_gitroot="git://github.com/tongwang/s3fs-c.git"
_gitname="s3fs-c"

build() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  make -C "$srcdir/$_gitname-build" DESTDIR="$pkgdir/" install
}

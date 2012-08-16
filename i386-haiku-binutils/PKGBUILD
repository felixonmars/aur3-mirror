pkgname=i386-haiku-binutils
pkgver=20120809
pkgrel=2
pkgdesc="A set of programs to assemble and manipulate binary and object files (Haiku)"
arch=(i686 x86_64)
url="http://haiku-os.org/development"
license=("GPL")
depends=(glibc)
makedepends=(git)
_gitroot="git://git.haiku-os.org/buildtools"
_gitname="buildtools"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [[ -d "$_gitname" ]]
  then
    rm -r "$srcdir/$_gitname-build"
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/binutils"
  ./configure \
    --prefix=/usr \
      --target=i386-haiku \
      --host=$CHOST \
      --build=$CHOST \
      --disable-nls
  make
}

package() {
  cd "$srcdir/$_gitname-build/binutils"
  make DESTDIR=$pkgdir install
  rm -r "$pkgdir/usr/lib"
  rm -r "$pkgdir/usr/share"
}
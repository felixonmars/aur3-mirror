pkgname=i386-haiku-binutils-git
pkgver=20120309
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (Haiku, git repo)"
arch=('i686' 'x86_64')
url="http://haiku-os.org/development"
license=('GPL')
depends=('glibc')
makedepends=(git)
_gitroot=git://git.haiku-os.org/buildtools
_gitname=buildtools

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [[ -d "$_gitname" ]]
  then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/binutils"
  ./configure --prefix=/usr --target=i386-haiku --host=$CHOST --build=$CHOST --disable-nls
  make
  make DESTDIR=$pkgdir install
  rm -rf $pkgdir/usr/lib
  rm -rf $pkgdir/usr/share/{info,man}
}
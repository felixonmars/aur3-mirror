# maintainer: Robert Fey <feyrob@gmail.com>
pkgname=h4checksum
_sname=h4checksum
pkgver=20111215
pkgrel=1
pkgdesc="Create rotation and mirror independant checksums of raster graphic image files.\
 Please note, that this is my first package and of ultra low quality. 
"
#arch=('i686' 'x86_64')
arch=('x86_64')
url="http://github.com/refi/h4checksum"
license=('Apache') # the project it self uses Code in the public domain and under Apache License

depends=('imagemagick' 'crypto++' 'google-gflags')
makedepends=('scons' 'git')
# TODO 
#source=($pkgname-$pkgver.tar.gz)
#source=($pkgname-$pkgver-1-x86_64.pkg.tar.xz)

#source=('https://github.com/refi/h4checksum/tarball/master')
#md5sums=('3cf6a77b097060e7c8d7c02dff17fb20')
source=()
md5sums=()

#_gitroot="git://gitorious.org/sup/mainline.git"
#_gitroot="git@github.com:refi/h4checksumgit"
_gitroot="git://github.com/refi/h4checksum.git"
_gitname="h4checksum"

build() {
  cd "$srcdir"
  #cd "$srcdir-$pkgver"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting scons..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  #msg "c"
  #pwd
  #msg "d"
  cd "$srcdir/$_gitname-build"
  #msg "e"
  #pwd
  #msg "f"
  #msg  "Patching the rakefile"
  #patch -p1 -i ../rakefile.patch

  #msg "Building the gem"
  msg "Building executable, shared library and static library"
  scons

  #msg "Installing executable, shared library and static library"
  #scons install

  #rake gem
  #pwd
  #scons


  #cd pkg
  #local _gemdir="$(ruby --enable-gems -e'puts Gem.default_dir')"

  #local target="${pkgdir}${_gemdir}"
  #local bintarget="$pkgdir/usr/bin"
  #install -d "${bintarget}"

  #gem install -li "${target}" sup -n "${bintarget}" --ignore-dependencies
}

package() {
  mkdir -p ../pkg/usr/bin
  mkdir -p ../pkg/usr/lib
  mkdir -p ../pkg/usr/include
  #cp ex/* ../pkg/usr/bin/
  #msg "a"
  #pwd
  #msg "b"
  #cd "$srcdir/$_gitname-build"
  #msg "h"
  #pwd
  #msg "g"

  cp "$srcdir/$_gitname-build/build_std/$_sname" ../pkg/usr/bin/
  cp "$srcdir/$_gitname-build/build_std/lib$_sname.so" ../pkg/usr/lib/
  cp "$srcdir/$_gitname-build/build_std/lib$_sname.a" ../pkg/usr/lib/
  cp "$srcdir/$_gitname-build/include/$_sname.h" ../pkg/usr/include/

  #cd ..
  #cp ex/* ../pkg/

  #msg "1"
  #pwd
  #msg "2"
  #ls -lah
  #msg "3"
  #cd ../pkg
  #msg "4"
  #ls -lah
  #msg "5"
}

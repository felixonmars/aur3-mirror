# Contributor: Martin Ellis <ellism88@gmail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>

_pkgname32=kroc
pkgname=bin32-$_pkgname32
pkgver=7227
pkgrel=1
pkgdesc="Kent Retargetable occam Compiler. An occam-pi compiler."
arch=('x86_64')
url="http://projects.cs.kent.ac.uk/projects/kroc/trac/wiki"
license=('GPL')
groups=()
depends=('lib32-libv4l' 'bash' 'binutils' 'gawk' 'pkgconfig' 'lib32-libpng' 'lib32-libxmu' 'lib32-libxi' 'perl' 'python2' 'lib32-libxslt')
makedepends=('subversion')
optdepends=('sdl' 'sdl_sound' 'mesa')
provides=("kroc" "kroc-setup.sh" "occ21")
conflicts=($_pkgname32)
md5sums=(eb6839a64ac4a5303d333276eaf48ce0)
source=(arch.diff)

_svntrunk="http://projects.cs.kent.ac.uk/projects/kroc/svn/kroc/trunk/"
_svnmod="svnmod"

build() {

CC="$CC -m32"

  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  export PYTHON="python2"
  for file in $(find . -name '*.py' -print); do
    echo Fixing up $file.
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' tools/kroc/occbuild.in
  sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' tools/kroc/occbuild.in

  sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' tools/occamdoc/occamdoc.in
  sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' tools/occamdoc/occamdoc.in

  sed -i 's_python__' runtime/ccsp/include/Makefile.am

  patch -p0 -i ../arch.diff
  
  autoreconf -vfi
  ./configure --prefix=/usr --libdir=/user/lib32
  make
  make check
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

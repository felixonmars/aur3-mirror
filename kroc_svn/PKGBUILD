# Maintainer: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Martin Ellis <ellism88@gmail.com>

pkgname=kroc_svn
pkgver=7239
pkgrel=1
pkgdesc="Kent Retargetable occam Compiler. An occam-pi compiler."
arch=('i686')
url="http://projects.cs.kent.ac.uk/projects/kroc/trac/wiki"
license=('GPL')
groups=()
depends=('libv4l' 'bash' 'binutils' 'gawk' 'pkgconfig' 'libpng' 'libxmu' 'libxi' 'perl' 'python2' 'libxslt')
makedepends=('subversion')
optdepends=('sdl' 'sdl_sound' 'mesa')
provides=("kroc" "kroc-setup.sh" "occ21")
md5sums=(eb6839a64ac4a5303d333276eaf48ce0)
source=(arch.diff)

_svntrunk="http://projects.cs.kent.ac.uk/projects/kroc/svn/kroc/trunk/"
_svnmod="svnmod"

build() {
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
  find -not -iwholename "*.svn*" -type f -exec sed -i -e 's/env python/&2/' \
    -e 's_/bin/python_&2_' -e 's/PYTHON=python/&2/' '{}' ';'

  sed -i 's_python__' runtime/ccsp/include/Makefile.am
  patch -p0 -i ../../arch.diff

  autoreconf -vfi
  ./configure --prefix=/usr
  make
  make check
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 tw=0 et:

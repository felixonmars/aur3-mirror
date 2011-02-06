# Contributor: Tavian Barnes <tavianator@gmail.com>
pkgname=klee-svn
pkgver=115542
pkgrel=1
pkgdesc="A symbolic virtual machine on top of LLVM"
arch=('i686' 'x86_64')
url="http://klee.llvm.org/"
license=('custom')
groups=()
depends=()
makedepends=('subversion' 'llvm-gcc')
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
_uclibc="http://t1.minormatter.com/~ddunbar/klee-uclibc-0.01.tgz"
[ "$CARCH" = "x86_64" ] && _uclibc="http://www.doc.ic.ac.uk/~cristic/klee-uclibc-0.01-x64.tgz"
source=($_uclibc
        "http://llvm.org/releases/2.7/llvm-2.7.tgz")
md5sums=('44a86323142ada27f7666b2c3d2c40ea'
         'ac322661f20e7d6c810b1869f886ad9b')

_svntrunk="http://llvm.org/svn/llvm-project/klee/trunk"
_svnmod=klee

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/llvm-2.7"
  ./configure --enable-optimized
  make

  cd "$srcdir/klee-uclibc"
  ./configure --with-llvm=../llvm-2.7
  make

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  ./configure --prefix=/usr \
              --with-llvm=../llvm-2.7 \
              --with-uclibc=../klee-uclibc \
              --enable-posix-runtime
  make ENABLE_OPTIMIZED=1
  make check
  make unittests
  sed -i 's|PROJ_INSTALL_ROOT := \(.*\)|PROJ_INSTALL_ROOT := '"$pkgdir/"'\1|g' Makefile.config
}

package() {
  cd "$srcdir/$_svnmod-build"
  make -k install || true
}

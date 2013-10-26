# Maintainer: mmm

# pkgbuild based on clang-svn, so thanks guys! 

# Contributor: Henning Pohl <henning@still-hidden.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: Sebastian Nowicki <sebnow@gmail.com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=clang-modernize-svn
pkgver=193252
_gcc_ver=4.7.2
pkgrel=3
pkgdesc="Clang automated migration / convert tool for C++11"
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('custom')
depends=('clang')
makedepends=('svn' 'cmake')
provides=('clang-modernize' 'clang-migrate')
conflicts=(clang-modernize)

_svntrunk="http://llvm.org/svn/llvm-project"
_svnmod="llvm"
_cfemod="cfe"
_crtmod="clang-tools-extra"

build() {
  cd "$srcdir"

  msg2 "Connecting to LLVM.org SVN server...."

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn update -r $pkgver) || warning "Update failed!"
  else
    svn co $_svntrunk/$_svnmod/trunk $_svnmod --config-dir ./ -r $pkgver
  fi

  if [ -d $_cfemod/.svn ]; then
    (cd $_cfemod && svn update -r $pkgver) || warning "Update failed!"
  else
    svn co $_svntrunk/$_cfemod/trunk $_cfemod --config-dir ./ -r $pkgver
  fi

  if [ -d $_crtmod/.svn ]; then
    (cd $_crtmod && svn update -r $pkgver) || warning "Update failed!"
  else
    svn co $_svntrunk/$_crtmod/trunk $_crtmod --config-dir ./ -r $pkgver
  fi

  msg2 "SVN checkout done or server timeout"

  rm -rf $_svnmod-build
  svn export $_svnmod $_svnmod-build
  svn export $_cfemod $_svnmod-build/tools/clang
  svn export $_crtmod $_svnmod-build/tools/clang/tools/extra
  #svn export $_cxxmod $_svnmod-build/projects/libcxx
  cd $_svnmod-build

  # Find our headers
  sed -i "s|/usr/local/include|/usr/include/c++/$_gcc_ver|g" tools/clang/lib/Frontend/InitHeaderSearch.cpp

  msg2 "Starting build..."

  [[ -d build ]] && rm -r build
  mkdir build && cd build

  export CFLAGS="$CFLAGS -fno-tree-pre"
  export CXXFLAGS="$CFLAGS -fno-tree-pre"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -LLVM_ENABLE_ASSERTIONS=OFF \
    -LLVM_ENABLE_FFI=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    ..

  make clang-modernize
}

package() {
  cd "$srcdir/$_svnmod-build"

  cd build
  
  # copy only clang-modernize clang-tidy related files
  make DESTDIR=$pkgdir install
  cd $pkgdir
  find . -type f ! \( -iname "*modernize*" -o -iname "*tidy*" -o -iname "*replacements*" \) -exec rm -f {} \; 
  rm -f usr/bin/clang  usr/bin/clang++ usr/bin/clang-cl usr/include/clang/Tooling/ReplacementsYaml.h usr/lib/libclang.so 


  cd "$srcdir/$_svnmod-build"

  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:


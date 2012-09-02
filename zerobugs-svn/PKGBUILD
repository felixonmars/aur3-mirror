# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=zerobugs-svn
pkgver=69011
pkgrel=1
pkgdesc="A modular debugger for C/C++/D programming languages"
arch=('i686' 'x86_64')
url="http://www.zero-bugs.com/"
license=('custom')
depends=('gtksourceviewmm2' 'gtkhtml' 'elfutils' 'boost-libs' 'desktop-file-utils')
optdepends=('python2: GUI and Python scripting')
makedepends=('boost' 'python2')
provides=('zerobugs')
conflicts=('zerobugs')
replaces=('zerobugs')
options=(!buildflags !makeflags)
install=zerobugs.install
source=(python_includes.diff gcc_4.7-fix.diff)
md5sums=('99b3ee460b17523839d7b73b6b3b6bdb'
         '042951b929cb56003ef789ddc6e78a30')

_svntrunk="https://zerobugs.svn.codeplex.com/svn"
_svnmod="zerobugs"

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

  # use python2
  sed -i 's|python|python2|' third_party_libs/ud/libudis86/Makefile.*
  # ugly fix for the python include path
  patch -Np1 < "$srcdir/python_includes.diff" || true
  # make sure there's only only one build job
  # otherwise it sometimes doesn't build correctly
  export MAKEFLAGS="-j1"
  sed -i 's|make_jobs=.*|make_jobs=1|' build
  # fix build errors with gcc 4.7
  patch -Np0 < "$srcdir/gcc_4.7-fix.diff"
  # do not run unmangle tests, as they break the build
  sed -i 's|\(^all.*\) test|\1|' unmangle/Makefile

  ./build
}

package() {
  cd "$srcdir/$_svnmod-build"
  echo "$pkgdir/opt/zerobugs" | ./build --install

  # install the desktop file and the icon manually
  install -D -m644 zero.desktop "$pkgdir/usr/share/applications/zero.desktop"

  # fix the paths
  sed -i "s|$pkgdir||g" "$pkgdir/opt/zerobugs/bin/zero"
  sed -i 's|/usr/local|/opt/zerobugs|' "$pkgdir/usr/share/applications/zero.desktop"

  # install license
  install -D -m644 LICENSE_1_0.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE_1_0.txt"
  install -D -m644 LIBDWARFCOPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LIBDWARFCOPYRIGHT"
}

# vim:set ts=2 sw=2 et:

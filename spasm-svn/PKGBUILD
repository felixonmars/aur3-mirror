# Contributor: Jon Sturm <jonimoose@gmail.com>
pkgname=spasm-svn
pkgver=55155
pkgrel=1
pkgdesc="a cross platfrom z80 assembler aimed at development for TI Graphing Calculators"
arch=(i686 x86_64)
url="http://revsoft.org"
license=('GPL')
depends=(gmp openssl)
makedepends=('subversion')

_svntrunk=https://wabbit.svn.codeplex.com/svn/Wabbitstudio/Source/SPASM/
_svnmod=spasm

build() {
  #the default system LDFLAGs break things so unset them.
  unset LDFLAGS
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  make || return 1
  mkdir -p $pkgdir/usr/bin
  install -m 755 $srcdir/$_svnmod-build/spasm $pkgdir/usr/bin/spasm
}

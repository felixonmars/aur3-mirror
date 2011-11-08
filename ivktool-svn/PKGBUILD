pkgname=ivktool-svn
pkgver=5923
pkgrel=1
pkgdesc="A helper program with some special functions for invertika-developer"
arch=('any')
url="http://invertika.org/"
license=('GPL2')
makedepends=('subversion' 'monodevelop')
depends=('mono')
provides=('ivktool')
_svntrunk="http://invertika.googlecode.com/svn/trunk/tools"
_svnmod=invertika-tools

build() {
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
  cd "./ivktool"
  mdtool build
  mkdir -p $pkgdir/opt/ivktool
  mkdir -p $pkgdir/usr/bin
  cp ./bin/Debug/* $pkgdir/opt/ivktool/
  install ./packaging/arch/ivktool $pkgdir/usr/bin/
}

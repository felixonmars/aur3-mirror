
# See http://wiki.archlinux.org/index.php/Arch_CVS_&_SVN_PKGBUILD_guidelines
# for more information on packaging from SVN sources.

# Contributor: smartcat99s <smartcat99s AT gmail>
pkgname=hfm-net-svn
pkgver=182
pkgrel=1
pkgdesc="Folding@Home monitor written in .NET/mono"
arch=('i686' 'x86_64')
url="http://code.google.com/p/hfm-net/"
license=('GPL2')
depends=('mono')
makedepends=('subversion' 'monodevelop')
install=
source=()
noextract=()
md5sums=()

_svntrunk=http://hfm-net.googlecode.com/svn/trunk/
_svnmod=hfm-net

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
  cd HTMLparser2
  mdtool build -c:Release || exit 1
  cd ..
  mdtool build -c:Release HFM.sln || exit 1

  #
  # INSTALL
  #
  install -D -m755 $srcdir/$_svnmod-build/HFM/bin/Release/HFM.exe $pkgdir/opt/hfm-net/HFM.exe
  install -D -m644 $srcdir/$_svnmod-build/HFM/bin/Release/*.config $pkgdir/opt/hfm-net/
  install -D -m644 $srcdir/$_svnmod-build/HFM/app.config $pkgdir/opt/hfm-net/HFM.exe.config
  install -D -m755 $srcdir/$_svnmod-build/HFM/bin/Release/*.dll $pkgdir/opt/hfm-net/
  install -D -m644 $srcdir/$_svnmod-build/HFM/bin/Release/*.txt $pkgdir/opt/hfm-net/
  install -d $pkgdir/opt/hfm-net/{CSS,XML,XSL}
  install -D -m644 $srcdir/$_svnmod-build/HFM/bin/Release/CSS/* $pkgdir/opt/hfm-net/CSS
  install -D -m644 $srcdir/$_svnmod-build/HFM/bin/Release/XML/* $pkgdir/opt/hfm-net/XML
  install -D -m644 $srcdir/$_svnmod-build/HFM/bin/Release/XSL/* $pkgdir/opt/hfm-net/XSL
}

# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=jskat-svn
pkgver=1588
pkgrel=1
pkgdesc="free implementation of the German card game Skat in Java"
arch=('any')
url="http://www.jskat.de"
license=('GPL2')
groups=()
depends=('java-runtime')
makedepends=('apache-ant' 'subversion')
source=(jskat.sh)
md5sums=('9a5f4f028121d878f1bb6caab016e135')
noextract=()

_svntrunk=https://jskat.svn.sourceforge.net/svnroot/jskat
_svnmod=jskat

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  [[ -d $srcdir/$_svnmod-build ]] && rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build/jskat/branches/jansch/jskat"

  #
  # BUILD
  #
  /usr/share/java/apache-ant/bin/ant
  install -Dm644 JSkat.jar $pkgdir/usr/share/java/$pkgname/JSkat.jar
  install -Dm755 $srcdir/jskat.sh $pkgdir/usr/bin/jskat
}

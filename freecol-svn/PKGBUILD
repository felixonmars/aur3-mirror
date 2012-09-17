# Maintainer: Lone_Wolf lonewolf@xs4all.nl
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Nelson Menon <nelsonmenon@gmail.com insanatorium.wordpress.com>

pkgname=freecol-svn
pkgver=10139
pkgrel=1
pkgdesc="A turn-based strategy game based on Colonization, svn version"
arch=(any)
url="http://www.freecol.org/"
license=('GPL')
depends=('java-environment' 'bash')
makedepends=('subversion' 'apache-ant' 'junit' 'texlive-core')
source=(fc-svn.desktop
        fc-svn.sh)
md5sums=('5f169b8a679931519cfd339eb4b24da5'
         '23631acb837b50d1030cba6c2710cfee')
_svntrunk="https://freecol.svn.sourceforge.net/svnroot/freecol/freecol/trunk"
_svnmod="freecol"

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  
  msg "Starting build..."
  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
  ant print-manual package
}
package() {
  cd "$srcdir/$_svnmod-build"
  install -Dm644 FreeCol.jar "$pkgdir/usr/share/java/$pkgname/FreeCol.jar"
  install -Dm644 doc/FreeCol.pdf "$pkgdir/usr/share/doc/$pkgname/FreeCol.pdf"
  install -Dm644 packaging/common/freecol.xpm "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
  install -Dm644 ../fc-svn.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 ../fc-svn.sh "$pkgdir/usr/bin/$pkgname"

  cp -r data jars "$pkgdir/usr/share/java/$pkgname/"
  find "$pkgdir/usr/share/java/$pkgname" -type d -exec chmod 755 '{}' \;
  find "$pkgdir/usr/share/java/$pkgname" -type f -exec chmod 644 '{}' \;
}

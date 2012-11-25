# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Andreas Eisele <a.e -at- lupuz.de>
# Contributor: Hy Goldsher aka hyness <hyness-at-gmail>

pkgname=davmail-svn
pkgver=2056
pkgrel=1
pkgdesc="POP/IMAP/SMTP/Caldav/Carddav/LDAP Exchange Gateway"
arch=('i686' 'x86_64')
url="http://davmail.sourceforge.net/"
license=('GPL')
depends=('java-environment' 'hicolor-icon-theme')
makedepends=('subversion' 'apache-ant')
conflicts=('davmail')
install=davmail.install
source=(davmail.desktop davmail.sh)
md5sums=('d46bbefe452e201680af00af088c210b'
         '69383d024046aa54f6f93f05c8e4b5f9')

_svntrunk=https://davmail.svn.sourceforge.net/svnroot/davmail/trunk
_svnmod=davmail

build() {
  cd "$srcdir"

  if [[ -d $_svnmod/.svn ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  ant
}

_distdir="$srcdir/$_svnmod-build/dist"

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr"/{bin,share/java/$_svnmod/lib}
  install -m644 "$_distdir/lib"/* "$pkgdir/usr/share/java/$_svnmod/lib/"
  install -m755 "$srcdir/$_svnmod.sh" "$pkgdir/usr/share/java/$_svnmod/"
  ln -s /usr/share/java/$_svnmod/$_svnmod.sh "$pkgdir/usr/bin/$_svnmod"
  install -Dm644 "$_distdir/$_svnmod.jar" \
    "$pkgdir/usr/share/java/$_svnmod/$_svnmod.jar"
  install -Dm644 "$srcdir/$_svnmod.desktop" \
    "$pkgdir/usr/share/applications/$_svnmod.desktop"

  rm -f "$pkgdir/usr/share/java/$_svnmod/lib"/*win32*
  if [[ $CARCH == x86_64 ]]; then
    rm -f "$pkgdir/usr/share/java/$_svnmod/lib"/*x86.jar
  else
    rm -f "$pkgdir/usr/share/java/$_svnmod/lib"/*x86_64.jar
  fi

  cd "$_distdir"
  bsdtar -xf $_svnmod.jar tray{2,32,48}.png
  install -Dm644 tray2.png \
    $pkgdir/usr/share/icons/hicolor/16x16/apps/$_svnmod.png
  install -Dm644 tray32.png \
    $pkgdir/usr/share/icons/hicolor/32x32/apps/$_svnmod.png
  install -Dm644 tray48.png \
    $pkgdir/usr/share/icons/hicolor/48x48/apps/$_svnmod.png
}

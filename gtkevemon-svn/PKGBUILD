# Contributor: Chrysalis <mindaxis[at]gmail[dot]com>
# Contributor: andrew <andrew[at]andrewyates[dot]net>

pkgname=gtkevemon-svn
pkgver=124
pkgrel=1
pkgdesc="GTK clone of EveMon skill monitor for EVE Online"
arch=('i686' 'x86_64')
url="http://gtkevemon.battleclinic.com/index.html"
license=('GPL3')
depends=('gtk2' 'gtkmm' 'libxml2')
makedepends=('subversion')
provides=('gtkevemon')
conflicts=('gtkevemon')
options=()
install=
source=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=svn://svn.battleclinic.com/GTKEVEMon/trunk/gtkevemon
_svnmod=gtkevemon

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

  make
}

package() {
  cd "${srcdir}/${_svnmod}-build"
  make INSTALL_BIN=$pkgdir/usr/bin \
    INSTALL_DIR_ICON=$pkgdir/usr/share/pixmaps \
    INSTALL_DIR_DESK=$pkgdir/usr/share/applications \
    install
}

# vim:set ts=2 sw=2 et:

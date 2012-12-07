# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: stalker_exe <stalkerexe8@gmail.com>
# Maintainer:  Federico Cinelli <cinelli.federico@gmail.com>

pkgname=4pane-svn
epoch=1
pkgver=322
pkgrel=1
pkgdesc="A multi-pane, detailed-list file manager. SVN version."
arch=('i686' 'x86_64')
url="http://www.4pane.co.uk/index.html"
license=('GPL3')
depends=('wxgtk')
makedepends=('subversion')
source=('4Pane.desktop')
md5sums=('b3bafbcc64bde3e3742f994574da5fdd')
conflicts=('4pane')
provides=('4pane')

_svntrunk="https://fourpane.svn.sourceforge.net/svnroot/fourpane"
_svnmod="fourpane"

build() {
  msg "Starting SVN checkout..."
  cd ${srcdir}
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -d ${srcdir}/$_svnmod-build ]; then
    rm -rf $_svnmod-build
  fi

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/trunk

  ./configure --prefix=/usr --disable-desktop --disable-symlink
  make
}

package() {
  cd $srcdir/$_svnmod-build/trunk
  make DESTDIR="$pkgdir" install

  install -d -m755 "$pkgdir"/usr/share/{applications,pixmaps}
  install -D -m644 "$srcdir"/4Pane.desktop "$pkgdir"/usr/share/applications/
  ln -s $srcdir/$_svnmod-build/trunk/bitmaps/4PaneIcon48.png "$pkgdir"/usr/share/pixmaps/4Pane.png
}

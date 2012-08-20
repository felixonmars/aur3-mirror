 # Maintainer: Dany Martineau <dany.luc.martineau [at] gmail.com>
pkgname=tab-rhythmbox-plugin-svn
pkgver=26
pkgrel=1
pkgdesc="Search and display guitar tablature in Rhythmbox"
arch=('any')
url="http://code.google.com/p/tab-rhythmbox-plugin/"
license=('GPL3')
conflicts=('')
depends=('rhythmbox>=2.90' 'python2-lxml')
makedepends=('svn')
install=tab-rhythmbox-plugin.install

_svntrunk="http://tab-rhythmbox-plugin.googlecode.com/svn/trunk"
_svnmod="tab-rhythmbox-plugin"


build() {
    cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cd "$srcdir/$_svnmod"
  install -d $pkgdir/usr/lib/rhythmbox/plugins/
  install -d $pkgdir/usr/share/rhythmbox/plugins/tabsearch
  install -d $pkgdir/usr/share/glib-2.0/schemas/
}

package() {
  cd "$srcdir/$_svnmod"
  cp -r tabsearch $pkgdir/usr/lib/rhythmbox/plugins/
  cp tabsearch/tab-prefs.ui $pkgdir/usr/share/rhythmbox/plugins/tabsearch
  cp tab-rhythmbox.svg $pkgdir/usr/share/rhythmbox/plugins/tabsearch
  cp org.gnome.rhythmbox.plugins.tabsearch.gschema.xml $pkgdir/usr/share/glib-2.0/schemas/
}
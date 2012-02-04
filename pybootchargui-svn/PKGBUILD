# Contributor : Géraud Le Falher <daureg@gmail.com>

pkgname=pybootchargui-svn
pkgver=141
pkgrel=1
pkgdesc="a tool for visualization and analysis of the GNU/Linux boot process."
url="http://code.google.com/p/pybootchartgui/"
license=('GPL3')
arch=(any)
groups=('system')
depends=('python')
makedepends=('setuptools')
optdepends=('bootchart: to get data')
conflicts=('pybootchargui')
provides=('pybootchargui')
options=(!emptydirs)
_svntrunk=http://pybootchartgui.googlecode.com/svn/trunk/
_svnmod=pybootchargui

build() {
  cd ${srcdir}
  msg "Connecting to $_svnmod SVN server..."
  if [ -d $_svnmod/.svn ]; then 
    (cd $_svnmod && svn up -r $pkgver) 
  else 
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod 
  fi 
  msg "SVN checkout done or server timeout"
  cd $_svnmod
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
# vim: set ft=sh ts=2 sw=2 et:

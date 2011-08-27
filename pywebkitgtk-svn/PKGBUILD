# Contributor: Sergej Chodarev <sergejx@centrum.sk>
# Contributor: Chad D <arch@davtek.com>

pkgname=pywebkitgtk-svn
pkgver=57
pkgrel=1
pkgdesc="Python bindings to the WebKit GTK+ port"
arch=(i686 x86_64)
url="http://code.google.com/p/pywebkitgtk/"
license=('LGPL')
depends=('webkitgtk-svn' 'python')
makedepends=('git')
provides=('pywebkitgtk')
source=()
md5sums=()

_svntrunk="http://pywebkitgtk.googlecode.com/svn/trunk/"
_svnmod="pywebkitgtk"
build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
}

# vim:set ts=2 sw=2 et:

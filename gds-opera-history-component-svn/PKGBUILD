# Contributor: b9anders <b9anders@gmail.com>
pkgname=gds-opera-history-component-svn
pkgver=56
pkgrel=1
pkgdesc="The Opera Indexing component indexes your Opera browser bookmarks, and history so you can correctly search for them in Google Desktop Search."
arch=(any)
url="http://code.google.com/p/gsopcast/"
license=('GPL') 
depends=('opera' 'google-desktop' 'gnome-common')
makedepends=('pkgconfig')

_svnmod="gds-opera-history-component"
_svntrunk=http://gsopcast.googlecode.com/svn/trunk/

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
  (cd $_svnmod && svn up -r $pkgver)
  else
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

#  rm -r $startdir/src/$_svnmod
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install
}

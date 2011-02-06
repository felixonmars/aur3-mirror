#Maintained by pyther (xyz@pyther.net)

pkgname=deluge-client-svn
pkgver=3927
pkgrel=1
pkgdesc="Unoffical deluge-svn package... client only"
arch=('i686' 'x86_64')
url="http://deluge-torrent.org/"
license=('GPL2')
depends=('pygtk' 'boost' 'pyxdg' 'dbus-python' 'librsvg' 'desktop-file-utils'
         'hicolor-icon-theme' 'setuptools' 'patch')
makedepends=('subversion' 'intltool' 'boost')
conflicts=('deluge' 'deluge-svn')
provides=('deluge' 'deluge-svn')
options=('!emptydirs')
install=deluge.install
source=(client-only.patch)
md5sums=('bd57253a4d7c896dbaca59aef283fa9c')

_svntrunk="http://svn.deluge-torrent.org/trunk/"
_svnmod="trunk"

build() {
  cd ${startdir}/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  msg "Patching - Client Only"
  cat $startdir/client-only.patch | patch -p1 

  #Special CFLAGS
  #CFLAGS="$CFLAGS -fPIC"

  python setup.py build
  python setup.py install --root=$startdir/pkg

  rm  -rf  $startdir/src/$_svnmod-build

  #Will not work as we did not compile libtorrent!
  rm ${startdir}/pkg/usr/bin/deluged
}

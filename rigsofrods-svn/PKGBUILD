# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=rigsofrods-svn
pkgver=2132
pkgrel=1
pkgdesc="An open source vehicle simulator based on soft-body physics"
arch=('i686' 'x86_64')
url="http://www.rigsofrods.com"
license=('GPL')
depends=('angelscript' 'caelum-hg' 'mygui-svn' 'socketw' 'ogre' 'openal' 'ogre-pagedgeometry' 'wxgtk2.9')
optdepends=('rigsofrods-content-pack: Official contents pack')
makedepends=('cmake' 'subversion')
conflicts=('rigsofrods')
provides=('rigsofrods')
backup=('opt/rigsofrods/plugins.cfg')
source=('plugins.cfg'
        'RoR.desktop'
        'rorconfig.desktop'
        'RoR.png')
md5sums=('4a17e366ecfdb6f43ab448a45863a760'
         'f26d4c5e8ecbb799095452c5d9034625'
         'b4763676cfc156c854aeaa3481772291'
         'b1b8a67e7402f1fbbcf14dbf03303415')

_svnmod="ror-trunk"
_svntrunk="https://rigsofrods.svn.sourceforge.net/svnroot/rigsofrods/trunk"

build() {
 cd "$srcdir"
 mkdir -p ~/.subversion; touch ~/.subversion/servers
 msg "Connecting to SVN server..."
 msg "Checking out $_svnmod"
 yes "p" | svn co "$_svntrunk" "$_svnmod"
 msg "SVN checkout done or server timeout"

 msg "Starting build..."
 cd "$srcdir/$_svnmod"
 cmake \
  -DROR_BUILD_CONFIGURATOR=TRUE \
  -DROR_BUILD_CONVERTER=TRUE \
  -DROR_BUILD_SIM=TRUE \
  -DROR_BUILD_TOOLS=TRUE \
  -DROR_USE_MYGUI=TRUE \
  -DROR_USE_OPENAL=TRUE \
  -DROR_USE_SOCKETW=TRUE \
  -DROR_USE_PAGED=TRUE \
  -DROR_USE_CAELUM=TRUE \
  -DROR_USE_ANGELSCRIPT=TRUE \
  -DROR_USE_CURL=TRUE \
  -DwxWidgets_wxrc_EXECUTABLE=/usr/bin/wxrc-2.9 \
  -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-2.9 \
  -DSOCKETW_INCLUDE_DIRS=/usr/include \
  -DSOCKETW_LIBRARIES=/usr/lib/libSocketW.so \
  -DCMAKE_PREFIX_PATH=/opt/rigsofrods .
 make
}

package() {
 mkdir "$pkgdir/opt"
 svn export "$srcdir/ror-trunk/bin" "$pkgdir/opt/rigsofrods"
 cp "$srcdir"/{ror-trunk/bin/{RoR,rorconfig,libangelscript_addons.a},plugins.cfg} "$pkgdir/opt/rigsofrods"

 install -Dm 644 "$srcdir/RoR.png" "$pkgdir/usr/share/pixmaps/RoR.png"
 install -Dm 644 "$srcdir/RoR.desktop" "$pkgdir/usr/share/applications/RoR.desktop"
 install -Dm 644 "$srcdir/rorconfig.desktop" "$pkgdir/usr/share/applications/rorconfig.desktop"
}

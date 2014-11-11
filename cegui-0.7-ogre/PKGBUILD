# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

# based on cegui from Arch Linux repository, original credits go to:
#   Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
#   Contributor: Juergen Hoetzel <juergen@archlinux.org>
#   Contributor: William Rea <sillywilly@gmail.com>,
#   Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>

pkgname=cegui-0.7-ogre
pkgver=0.7.9
pkgrel=3
pkgdesc="A free library providing windowing and widgets for graphics APIs/engines (legacy version with Ogre support)."
arch=('i686' 'x86_64')
url="http://crayzedsgui.sourceforge.net"
license=("MIT")
depends=('glew' 'freetype2' 'libxml2' 'devil' 'freeglut' 'lua51' 'silly' 'mesa' 'glm' 'glfw' 'ogre-1.8')
makedepends=('python2' 'doxygen' 'gtk2' 'boost' 'graphviz' 'ogre-1.8') # 'irrlicht')
optdepends=("python2: python bindings"
            "boost-libs: null renderer with python2"
            #"irrlicht: irrlicht module"
            "gtk2: gtk2 module")
provides=('cegui')
conflicts=('cegui' 'cegui-0.7')
options=('!libtool')
source=("http://downloads.sourceforge.net/crayzedsgui/CEGUI-$pkgver.tar.gz")
sha256sums=('7c3b264def08b46de749c2acaba363e907479d924612436f3bd09da2e474bb8c')

build() {
  cd CEGUI-$pkgver

  ./bootstrap
  export PKG_CONFIG_PATH="/opt/OGRE-1.8/lib/pkgconfig:$PKG_CONFIG_PATH"
  export LD_LIBRARY_PATH="/opt/OGRE-1.8/lib:$LD_LIBRARY_PATH"
  Lua_CFLAGS="$(pkg-config --cflags lua5.1)" \
  Lua_LIBS="$(pkg-config --libs lua5.1)" \
  PYTHON="/usr/bin/python2" ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-null-renderer --with-gtk2 --disable-samples \
    --disable-irrlicht-renderer

  make
}

package() {
  cd CEGUI-$pkgver

  make DESTDIR="$pkgdir/" install

  install -Dm644 doc/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

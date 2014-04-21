# Maintainer: Charles Bos <charlesbos1 AT gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=hud-bzr
_bzrname=hud
pkgver=390
pkgrel=2
pkgdesc="Backend for the Unity HUD"
arch=('i686' 'x86_64')
url="https://launchpad.net/hud"
license=('GPL')
groups=('unity')
depends=('bamf' 'dee-ubuntu' 'dee-qt-bzr' 'libcolumbus' 'libdbusmenu-gtk3' 'libdbusmenu-qt5' 'mscgen' 'sqlite' 'pocketsphinx' 'sphinx-voxforge-en' 'sphinxbase' 'pulseaudio' 'gsettings-qt-bzr' 'libqtdbustest-bzr' 'libqtdbusmock-bzr' 'unity-voice-bzr')
makedepends=('bzr' 'cmake' 'gnome-common' 'gnome-doc-utils' 'gobject-introspection' 'gtk-doc' 'intltool' 'qt5-base' 'python2-distribute' 'vala')
optdepends=('indicator-appmenu-bzr: HUD support')
provides=('hud')
install=hud.install
source=("$_bzrname::bzr+http://bazaar.launchpad.net/~indicator-applet-developers/$_bzrname/trunk.14.04/"
        '0001_Python_2.patch')
md5sums=('SKIP'
         '765e159bd8cc37410b87ecb8c95ca7de')

pkgver() {
  cd $_bzrname
  bzr revno
}

prepare() {
  cd "${srcdir}"/$_bzrname

  patch -p1 -i "${srcdir}/0001_Python_2.patch"
}

build() {
  cd "${srcdir}"/$_bzrname

  rm -rf build && mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DENABLE_DOCUMENTATION=ON \
    -DENABLE_TESTS=OFF \
    -DENABLE_VOICE_TESTS=OFF \
    -DENABLE_SCALABILITY_TESTS=OFF \
    -DFULL_WARNINGS=ON

  make -j1
}

package() {
  cd "${srcdir}/$_bzrname/build"
  make DESTDIR="${pkgdir}/" install
}

# Maintainer: /dev/rs0 <rs0@secretco.de.com>
# Contributor: Iven Hsu <ivenvd AT gmail>
# Contributor: Nathan Hulse <nat.hulse@gmail.com>
# Contributor: Charles Bos <charlesbos1 AT gmail>

# Comment by korrode
# Although their Launchpad landing page is not yet updated to reflect it, 0.9.11 is actually released
# Release commit: http://bazaar.launchpad.net/~compiz-team/compiz/0.9.12/revision/3873
# Source download: http://bazaar.launchpad.net/~compiz-team/compiz/0.9.12/tarball/3873
# Despite the "0.9.12" in the URL, it actually is the 0.9.11 final release, as stated in the commit.

pkgname=compiz-core-devel
#_pkgseries=0.9.11
#pkgver=${_pkgseries}.0
pkgver=0.9.11
pkgrel=2
pkgdesc="Composite manager for Aiglx and Xgl, with plugins and CCSM (development milestone)"
arch=('i686' 'x86_64')
url="https://launchpad.net/compiz"
license=('GPL' 'LGPL' 'MIT')
depends=('boost' 'xorg-server' 'libxcomposite' 'startup-notification' 'librsvg' 'dbus' 'mesa' 'libxslt' 'fuse' 'glibmm' 'libxrender' 'libwnck' 'pygtk' 'desktop-file-utils' 'pyrex' 'protobuf' 'metacity2' 'gnome-themes-standard' 'glu' 'libsm' 'dconf')
makedepends=('cmake' 'intltool')
optdepends=(
  'gnome-control-center: GNOME keybindings support (need to rebuild this package)'
  'kdebase-workspace: KDE window decoration support (need to rebuild this package)'
  'kdebase-lib: KDE window decoration support (need to rebuild this package)'
  'automoc4: KDE window decoration support (need to rebuild this package)'
  'xorg-xprop: grab various window properties for use in window matching rules'
)
conflicts=('compiz-core' 'compiz-core-bzr' 'compiz-fusion-plugins-main' 'compiz-fusion-plugins-extra' 'compiz-decorator-gtk' 'compiz-decorator-kde' 'libcompizconfig' 'compizconfig-python' 'compizconfig-backend-gconf' 'compiz-bcop' 'ccsm')
replaces=('compiz-bzr' 'compiz-core' 'compiz-fusion-plugins-main' 'compiz-fusion-plugins-extra' 'compiz-decorator-gtk' 'compiz-decorator-kde' 'libcompizconfig' 'compizconfig-python' 'compizconfig-backend-gconf' 'compiz-bcop' 'ccsm')
source=(
        "compiz-${pkgver}.tar.gz::http://bazaar.launchpad.net/~compiz-team/compiz/0.9.12/tarball/3873"
        # "https://launchpad.net/compiz/${_pkgseries}/${pkgver}/+download/compiz-${pkgver}.tar.bz2"
        "place-plugin-fix.patch"
        "set-gwd-default.patch"
        "focus-prevention-disable.patch")
sha256sums=(
            'SKIP'
            # '5de1a0f3d89f16b1f2bee30ce8e6135d7a438ea3b060a9ef8c4c006dc18a724f'
            '36b883526a6922b87c4091f26be19bdaf595fc1e3464703075b5946dd9915d47'
            '3aa6cb70f357b3d34d51735f4b5bcb0479086d7c7336de4bd8157569d6c52c08'
            'f4897590b0f677ba34767a29822f8f922a750daf66e8adf47be89f7c2550cf4b')
install='compiz-core-devel.install'

# GTK window decorator support
GTKWINDOWDECORATOR="On"
# Metaciy theme support for GTK window decorator
METACITY="On"
# KDE window decorator support
KDEWINDOWDECORATOR="Off"
# GSettings backend support
GSETTINGS="On"

prepare() {
  mv "~compiz-team/compiz/0.9.12/"  "compiz-${pkgver}"

  cd "compiz-${pkgver}"

  # Fix broken placement menu in the place plugin
  patch -Np1 -i "${srcdir}/place-plugin-fix.patch"

  # Set gtk-window-decorator as default in the Window Decoration plugin
  patch -Np1 -i "${srcdir}/set-gwd-default.patch"

  # Set focus prevention level to off which means that new windows will always get focus
  patch -Np1 -i "${srcdir}/focus-prevention-disable.patch"

  export PYTHON="/usr/bin/python2"

  find -type f \( -name 'CMakeLists.txt' -or -name '*.cmake' \) -exec sed -e 's/COMMAND python/COMMAND python2/g' -i {} \;
  find compizconfig/ccsm -type f -exec sed -e 's|^#!.*python|#!/usr/bin/env python2|g' -i {} \;

  mkdir build; cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCOMPIZ_DISABLE_SCHEMAS_INSTALL=On \
    -DCOMPIZ_BUILD_WITH_RPATH=Off \
    -DCOMPIZ_PACKAGING_ENABLED=On \
    -DBUILD_GTK="${GTKWINDOWDECORATOR}" \
    -DBUILD_METACITY="${METACITY}" \
    -DBUILD_KDE4="${KDEWINDOWDECORATOR}" \
    -DUSE_GCONF="Off" \
    -DUSE_GSETTINGS="${GSETTINGS}" \
    -DCOMPIZ_BUILD_TESTING=Off \
    -DCOMPIZ_WERROR=Off \
    -DCOMPIZ_DEFAULT_PLUGINS="composite,opengl,decor,resize,place,move"
}

build() {
  cd "compiz-${pkgver}/build"
  make
}

package() {
  cd "compiz-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  # Stupid findcompiz_install needs COMPIZ_DESTDIR and install needs DESTDIR
  # make findcompiz_install
  CMAKE_DIR=$(cmake --system-information | grep '^CMAKE_ROOT' | awk -F\" '{print $2}')
  install -dm755 "${pkgdir}${CMAKE_DIR}/Modules/"
  install -m644 ../cmake/FindCompiz.cmake "${pkgdir}${CMAKE_DIR}/Modules/"

  # Add documentation
  install -dm755 "${pkgdir}/usr/share/doc/compiz/"
  install ../{AUTHORS,NEWS,README} "${pkgdir}/usr/share/doc/compiz/"

  # Amend XDG .desktop file to load the compizconfig plugin with compiz
  sed -i 's/Exec\=compiz/Exec\=compiz ccp/' "${pkgdir}/usr/share/applications/compiz.desktop"

  # Add the pesky gsettings schema files manually
  if ls generated/glib-2.0/schemas/ | grep -qm1 .gschema.xml; then
    install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas/"
    install -m644 generated/glib-2.0/schemas/*.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/"
  fi

  # Remove GConf schemas
  rm -rv "${pkgdir}/usr/share/gconf/" 
}

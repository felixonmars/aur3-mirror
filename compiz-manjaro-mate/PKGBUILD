# Maintainer : Rob McCathie <korrode AT gmail>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Iven Hsu <ivenvd AT gmail>

_name=compiz
pkgname=compiz-manjaro-mate
_series=0.9.11
pkgver=${_series}.2
pkgrel=1
pkgdesc="OpenGL compositing window manager. Includes friendly defaults and autostart for MATE."
arch=('i686' 'x86_64')
url="https://launchpad.net/${_name}"
license=('GPL' 'LGPL' 'MIT')
depends=('boost' 'xorg-server' 'libxcomposite' 'startup-notification' 'librsvg' 'dbus' 'mesa' 'libxslt' 'fuse' 'glibmm' 'libxrender' 'libwnck' 'pygtk' 'desktop-file-utils' 'pyrex' 'protobuf' 'metacity' 'glu' 'libsm' 'dconf')
makedepends=('cmake' 'intltool')
#optdepends=()
conflicts=('compiz' 'compiz09-manjaro-test' 'compiz-core-bzr' 'compiz-core-devel' 'compiz-core' 'compiz-gtk-standalone' 'compiz-xfce' 'compiz-mate' 'compiz-core-mate' 'compiz-fusion-plugins-main' 'compiz-fusion-plugins-extra' 'compiz-fusion-plugins-unsupported' 'compiz-decorator-gtk' 'compiz-decorator-kde' 'libcompizconfig' 'compizconfig-python' 'compizconfig-backend-gconf' 'compiz-bcop' 'ccsm')
provides=("${_name}=${pkgver}" "${_name}-core=${pkgver}")
source=("${url}/${_series}/${pkgver}/+download/${_name}-${pkgver}.tar.bz2"
        "place-plugin-fix.patch"
        "set-gwd-default.patch"
        "focus-prevention-disable.patch"
        "${pkgname}-defaults.patch"
        "${pkgname}.gschema.override"
        "${pkgname}-decoratortheme"
        "${pkgname}-decoratortheme.desktop")
sha1sums=('fe94f4ee392c187679791ffeddc55fb155353f9e'
          '6b8e92ee404601b63ab7847e12232c27c2542891'
          'be585a68eacf93a1064ea914a927623c3e774b95'
          'b74ab025a89419c23d6f01c41e414281e1a2382f'
          '7f562edcbf65c72a91eb9e31386bf9382ff6b2b2'
          'e00e66eb4e2f36fe7cf0b61e057a6d36d2a4786e'
          '8eff3fedffb543960ebfc19b15e95d7f7a90ee50'
          '890b02696130b8275104aaea110b9beb3a162dce')
install="${pkgname}.install"

prepare() {
  cd "${_name}-${pkgver}"
  
  # Fix broken placement menu in the place plugin
  patch -Np1 -i "${srcdir}/place-plugin-fix.patch"

  # Set gtk-window-decorator as default in the Window Decoration plugin
  patch -Np1 -i "${srcdir}/set-gwd-default.patch"

  # Set focus prevention level to off which means that new windows will always get focus
  patch -Np1 -i "${srcdir}/focus-prevention-disable.patch"
  
  # Manjaro defaults
  patch -Np1 -i "${srcdir}/${pkgname}-defaults.patch"

  export PYTHON="/usr/bin/python2"

  find -type f \( -name 'CMakeLists.txt' -or -name '*.cmake' \) -exec sed -e 's/COMMAND python/COMMAND python2/g' -i {} \;
  find compizconfig/ccsm -type f -exec sed -e 's|^#!.*python|#!/usr/bin/env python2|g' -i {} \;

  mkdir build; cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DCOMPIZ_DISABLE_SCHEMAS_INSTALL=On \
    -DCOMPIZ_BUILD_WITH_RPATH=Off \
    -DCOMPIZ_PACKAGING_ENABLED=On \
    -DBUILD_GTK=On \
    -DBUILD_METACITY=On \
    -DBUILD_KDE4=Off \
    -DUSE_GCONF=Off \
    -DUSE_GSETTINGS=On \
    -DCOMPIZ_BUILD_TESTING=Off \
    -DCOMPIZ_WERROR=Off \
    -DCOMPIZ_DEFAULT_PLUGINS="composite,opengl,decor,resize,place,move,compiztoolbox,staticswitcher,expo,grid,regex,animation,ccp"
}

build() {
  cd "${_name}-${pkgver}/build"
  make
}

package() {
  cd "${_name}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  # Stupid findcompiz_install needs COMPIZ_DESTDIR and install needs DESTDIR
  # make findcompiz_install
  CMAKE_DIR=$(cmake --system-information | grep '^CMAKE_ROOT' | awk -F\" '{print $2}')
  install -dm755 "${pkgdir}${CMAKE_DIR}/Modules/"
  install -m644 ../cmake/FindCompiz.cmake "${pkgdir}${CMAKE_DIR}/Modules/"	

  # Add documentation
  install -dm755 "${pkgdir}/usr/share/doc/compiz/"
  install ../{AUTHORS,NEWS,README} "${pkgdir}/usr/share/doc/compiz/"

  # Add the pesky gsettings schema files manually
  if ls generated/glib-2.0/schemas/ | grep -qm1 .gschema.xml; then
    install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas/" 
    install -m644 generated/glib-2.0/schemas/*.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/" 
  fi 

  # Remove GConf schemas
  rm -rv "${pkgdir}/usr/share/gconf/"
  
  ## Manjaro-MATE stuff
  # Add Manjaro-MATE dconf/gsettings schema override file
  install -Dm644 "${srcdir}/${pkgname}.gschema.override" "${pkgdir}/usr/share/glib-2.0/schemas/${pkgname}.gschema.override"
  # Place initial decoration fix
  install -Dm755 "${srcdir}/${pkgname}-decoratortheme" "${pkgdir}/usr/bin/${pkgname}-decoratortheme"
  install -Dm644 "${srcdir}/${pkgname}-decoratortheme.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}-decoratortheme.desktop"
}


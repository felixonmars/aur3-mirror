pkgname=compiz-plugins-main-git
pkgver=20110827
pkgrel=1
pkgdesc="Compiz main plugins - Latest Git Version"
url="http://www.compiz.org/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
provides=('compiz-plugins-main')
conflicts=('compiz-plugins-main')
depends=('compiz-core-git')
makedepends=('intltool' 'cmake')

_gitroot="git://git.compiz.org/compiz/plugins-main/"
_gitname=plugins-main

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    git submodule update
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
    cd "${_gitname}"
    git submodule init
    git submodule update
  fi

  [[ -d build ]] || mkdir build
  cd build
  env PKG_CONFIG_PATH="/usr/lib/pkgconfig:$PKG_CONFIG_PATH" \
    cmake ..                                                \
      -DCMAKE_BUILD_TYPE="Release"                          \
      -DCOMPIZ_PLUGIN_INSTALL_TYPE="compiz"                 \
      -DCMAKE_INSTALL_PREFIX=/usr                           \
      -DCOMPIZ_DISABLE_PLUGIN_COLORFILTER=Off               \
      -DCOMPIZ_DISABLE_PLUGIN_WORKAROUNDS=Off               \
      -DCOMPIZ_DISABLE_PLUGIN_TEXT=Off                      \
      -DCOMPIZ_DISABLE_PLUGIN_SCALEADDON=Off                \
      -DCOMPIZ_DISABLE_PLUGIN_MOUSEPOLL=Off                 \
      -DCOMPIZ_DISABLE_PLUGIN_MAG=Off                       \
      -DCOMPIZ_DISABLE_PLUGIN_TITLEINFO=Off                 \
      -DCOMPIZ_DISABLE_PLUGIN_SHIFT=Off                     \
      -DCOMPIZ_DISABLE_PLUGIN_SESSION=Off                   \
      -DCOMPIZ_DISABLE_PLUGIN_ANIMATION=Off                 \
      -DCOMPIZ_DISABLE_PLUGIN_EXPO=Off                      \
      -DCOMPIZ_DISABLE_PLUGIN_SNAP=Off                      \
      -DCOMPIZ_DISABLE_PLUGIN_RING=Off                      \
      -DCOMPIZ_DISABLE_PLUGIN_PUT=Off                       \
      -DCOMPIZ_DISABLE_PLUGIN_WALL=Off                      \
      -DCOMPIZ_DISABLE_PLUGIN_IMGJPEG=Off                   \
      -DCOMPIZ_DISABLE_PLUGIN_STATICSWITCHER=Off            \
      -DCOMPIZ_DISABLE_PLUGIN_VPSWITCH=Off                  \
      -DCOMPIZ_DISABLE_PLUGIN_RESIZEINFO=Off                \
      -DCOMPIZ_DISABLE_PLUGIN_WINRULES=Off                  \
      -DCOMPIZ_DISABLE_PLUGIN_KDECOMPAT=Off                 \
      -DCOMPIZ_DISABLE_PLUGIN_NEG=Off                       \
      -DCOMPIZ_DISABLE_PLUGIN_THUMBNAIL=Off                 \
      -DCOMPIZ_DISABLE_PLUGIN_EZOOM=Off
  make
}

package() {
  cd "${srcdir}"
  cd "${_gitname}"
  cd build
  make DESTDIR="${pkgdir}" install
}


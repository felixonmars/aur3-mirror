pkgname=compiz-plugins-extra-git
pkgver=20110827
pkgrel=1
pkgdesc="Compiz extra plugins - Latest Git Version"
url="http://www.compiz.org/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
provides=('compiz-plugins-extra')
conflicts=('compiz-plugins-extra')
depends=('compiz-core-git' 'compiz-plugins-main-git')
makedepends=('intltool' 'cmake')

_gitroot="git://git.compiz.org/compiz/plugins-extra/"
_gitname=plugins-extra

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
      -DCOMPIZ_DISABLE_PLUGIN_FADEDESKTOP=Off               \
      -DCOMPIZ_DISABLE_PLUGIN_MAXIMUMIZE=Off                \
      -DCOMPIZ_DISABLE_PLUGIN_NOTIFICATION=Off              \
      -DCOMPIZ_DISABLE_PLUGIN_GRID=Off                      \
      -DCOMPIZ_DISABLE_PLUGIN_SHELF=Off                     \
      -DCOMPIZ_DISABLE_PLUGIN_CUBEADDON=Off                 \
      -DCOMPIZ_DISABLE_PLUGIN_SHOWDESKTOP=Off               \
      -DCOMPIZ_DISABLE_PLUGIN_LOGINOUT=Off                  \
      -DCOMPIZ_DISABLE_PLUGIN_WALLPAPER=Off                 \
      -DCOMPIZ_DISABLE_PLUGIN_GEARS=Off                     \
      -DCOMPIZ_DISABLE_PLUGIN_SPLASH=Off                    \
      -DCOMPIZ_DISABLE_PLUGIN_BENCH=Off                     \
      -DCOMPIZ_DISABLE_PLUGIN_BICUBIC=Off                   \
      -DCOMPIZ_DISABLE_PLUGIN_FIREPAINT=Off                 \
      -DCOMPIZ_DISABLE_PLUGIN_TD=Off                        \
      -DCOMPIZ_DISABLE_PLUGIN_SHOWMOUSE=Off                 \
      -DCOMPIZ_DISABLE_PLUGIN_MBLUR=Off                     \
      -DCOMPIZ_DISABLE_PLUGIN_GROUP=Off                     \
      -DCOMPIZ_DISABLE_PLUGIN_ANIMATIONADDON=Off            \
      -DCOMPIZ_DISABLE_PLUGIN_ADDHELPER=Off                 \
      -DCOMPIZ_DISABLE_PLUGIN_REFLEX=Off                    \
      -DCOMPIZ_DISABLE_PLUGIN_TRAILFOCUS=Off                \
      -DCOMPIZ_DISABLE_PLUGIN_WIDGET=Off                    \
      -DCOMPIZ_DISABLE_PLUGIN_CRASHHANDLER=Off              \
      -DCOMPIZ_DISABLE_PLUGIN_EXTRAWM=Off                   \
      -DCOMPIZ_DISABLE_PLUGIN_SCALEFILTER=Off
  make
}

package() {
  cd "${srcdir}"
  cd "${_gitname}"
  cd build
  make DESTDIR="${pkgdir}" install
}


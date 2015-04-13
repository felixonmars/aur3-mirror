# Contributor: Calimero <calimeroteknik at free dot fr>

_pkgname=cpc-reloaded
pkgname="${_pkgname}-svn"
pkgver=623
pkgrel=2
pkgdesc='CPC, 464, 664, 6128 Amstrad emulator'
arch=('i686' 'x86_64')
url='http://cpcsdk.googlecode.com/'
license=('GPL')
makedepends=('subversion' 'cmake')
depends=('libstsound2-git' 'portaudio' 'wxgtk2.8')
source=("${_pkgname}::svn+https://cpcsdk.googlecode.com/svn/trunk/Reloaded")
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  svnversion
}

prepare() {
  sed -i 's#"./logo.png"#"/usr/share/reloaded/logo.png"#' "${srcdir}/${_pkgname}/src/gui/CapriceApp.cpp"
  sed -i 's#"logo.png"#"/usr/share/reloaded/logo.png"#' "${srcdir}/${_pkgname}/src/gui/CapriceUI.cpp"
}

build() {
  cd "${srcdir}/${_pkgname}"

  rm -rf build
  mkdir build && cd build

  export CXXFLAGS="$CXXFLAGS -lpthread"

  msg cmake...
  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-2.8

  msg make...
  make

  cd ..
  sed 's#@DATA_DIR@#/usr/share/reloaded#' cap32.cfg.tpl > cap32.cfg
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -m 755 build/src/gui/reloaded "${pkgdir}/usr/bin/reloaded"

  install -d -m 755 "${pkgdir}/usr/share/reloaded/rom"
  install -m 644 rom/* "${pkgdir}/usr/share/reloaded/rom/"
  install -m 644 Keymap.cfg logo.png cap32.cfg "${pkgdir}/usr/share/reloaded/"
}

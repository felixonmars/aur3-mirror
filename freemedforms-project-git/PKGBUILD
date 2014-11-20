# Maintainer: ed0c <alexandre.piel at mailoo dot org>
# Thanks to the contribution of Benjarobin


pkgname=freemedforms-project-git
pkgver=release_0_7_6.r4799.g4e05836
pkgrel=2
pkgdesc="Electronic Medical Record Manager"
arch=(i686 x86_64)
url="http://www.freemedforms.com/en/"
license=('GPL3')
depends=('qt5-base' 'opencv' 'qt5-svg' 'qt5-script')
makedepends=('qt5-tools')
source=("git+https://github.com/FreeMedForms/freemedforms.git")
md5sums=('SKIP')
_srcname=freemedforms

pkgver() {
  cd "$_srcname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}


prepare() {
  cd "$srcdir/$_srcname/"

  # Fix filename...
  sed -i "s|Padtools.pluginspec|PadTools.pluginspec|g" plugins/padtoolsplugin/padtoolsplugin.pro freepad/plugins/padtoolsplugin/padtoolsplugin.pro

  [[ -f plugins/padtoolsplugin/Padtools.pluginspec ]] && \
    mv plugins/padtoolsplugin/Padtools.pluginspec plugins/padtoolsplugin/PadTools.pluginspec
  [[ -f freepad/plugins/padtoolsplugin/Padtools.pluginspec ]] && \
    mv freepad/plugins/padtoolsplugin/Padtools.pluginspec freepad/plugins/padtoolsplugin/PadTools.pluginspec
}

build() {

  # Generate translations 
  cd "$srcdir/$_srcname/global_resources/translations"
  lrelease-qt5 *.ts
  
  # Compiling source
  cd "$srcdir/$_srcname/"
  qmake-qt5 freemedforms.pro -r -config release \
    "CONFIG+=LINUX_INTEGRATED" \
    "LIBRARY_BASENAME=lib" \
    "INSTALL_ROOT_PATH=$pkgdir/usr/" \
    "LOWERED_APPNAME=freemedforms" \
    "CONFIG+=with-account" \
    "CONFIG+=with-agenda" \
    "CONFIG+=with-alerts" \
    "CONFIG+=with-feedback" \
    "CONFIG+=with-pmh" \
    "CONFIG+=with-webcam"

  make
}

package() {
  cd "$srcdir/$_srcname/"
  mkdir "$pkgdir/usr/"
  make install
}

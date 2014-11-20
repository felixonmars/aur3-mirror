# Maintainer: ed0c <alexandre.piel at mailoo dot org>
# Thanks to the contribution of Benjarobin

pkgname=freemedforms-project
pkgver=0.9.4
_pkgver=0.9.4
pkgrel=3
pkgdesc="Electronic Medical Record Manager"
arch=(i686 x86_64)
url="http://www.freemedforms.com/en/"
license=('GPL3')
depends=('qt5-base' 'opencv' 'qt5-svg' 'qt5-script' )
makedepends=('qt5-tools')
install="$pkgname.install"
source=("http://pkgs.fedoraproject.org/repo/pkgs/freemedforms/freemedforms-project-src_0.9.4.tgz/47b38648d3f581cb8627c175c2c01693/freemedforms-project-src_0.9.4.tgz")
md5sums=('47b38648d3f581cb8627c175c2c01693')


prepare() {
  cd "$srcdir/$pkgname-$_pkgver/"

  # Fix filename...
  sed -i "s|Padtools.pluginspec|PadTools.pluginspec|g" plugins/padtoolsplugin/padtoolsplugin.pro freepad/plugins/padtoolsplugin/padtoolsplugin.pro

  [[ -f plugins/padtoolsplugin/Padtools.pluginspec ]] && \
    mv plugins/padtoolsplugin/Padtools.pluginspec plugins/padtoolsplugin/PadTools.pluginspec
  [[ -f freepad/plugins/padtoolsplugin/Padtools.pluginspec ]] && \
    mv freepad/plugins/padtoolsplugin/Padtools.pluginspec freepad/plugins/padtoolsplugin/PadTools.pluginspec
}

build() {

  # Generate translations 
  cd "$srcdir/$pkgname-$_pkgver/global_resources/translations"
  lrelease-qt5 *.ts
  
  # Compiling source
  cd "$srcdir/$pkgname-$_pkgver"
   qmake-qt5 freemedforms.pro -r -config release \
    "CONFIG+=LINUX_INTEGRATED" \
    "LIBRARY_BASENAME=lib" \
    "INSTALL_ROOT_PATH=$pkgdir/usr/" \
    "LOWERED_APPNAME=$pkgname" \
    "CONFIG+=with-account" \
    "CONFIG+=with-agenda" \
    "CONFIG+=with-alerts" \
    "CONFIG+=with-feedback" \
    "CONFIG+=with-pmh" \
    "CONFIG+=with-webcam"

  make
}

package() {
  
  cd "$srcdir/$pkgname-$_pkgver"
  make install

}

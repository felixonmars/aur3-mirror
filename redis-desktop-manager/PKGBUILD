# Original Author: uglide
# Maintainer: JokerYu <dayushinn@gmail.com>

pkgname=redis-desktop-manager
pkgver=0.8.0_beta2
pkgrel=1
pkgdesc="A cross-platform open source Redis DB GUI management tool"
arch=("i686" "x86_64")
url="http://redisdesktop.com"
license=("MIT")
depends=("qt5-base" "libxkbcommon-x11" "libssh2" "hicolor-icon-theme")
makedepends=("git" "subversion")
install=rdm.install
_pkgname=RedisDesktopManager
_pkgver=${pkgver//_/-}

source=(
  "https://github.com/uglide/RedisDesktopManager/archive/${_pkgver}.tar.gz"
  "qtconsole::git+https://github.com/uglide/QtConsole.git#commit=41da2b2fb9555b2df236f4f68ee07cf5a16ddd54"
  "breakpad::git+https://chromium.googlesource.com/external/google-breakpad.git#commit=b0c09bd7ea0f6f0d035a16541814967f2611edcc"
  "easyloggingpp::git+https://github.com/easylogging/easyloggingpp.git#commit=f926802dfbde716d82b64b8ef3c25b7f0fcfec65"
  "lss::svn+http://linux-syscall-support.googlecode.com/svn/trunk/lss#revision=35"
)

md5sums=('1dcd8ebb355db4ce8f83aef905f1d5ca'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

build() {
  msg "building..."

  cd ${srcdir}/${_pkgname}-${_pkgver}/3rdparty
  rm -rf qtconsole easyloggingpp breakpad

  ln -s ${srcdir}/qtconsole ./
  ln -s ${srcdir}/easyloggingpp ./
  ln -s ${srcdir}/breakpad ./

  mkdir -p ./breakpad/src/src
  ln -s ${srcdir}/lss ./breakpad/src/src/
  ln -s ${srcdir}/lss ./breakpad/src/third_party/

  cd ${srcdir}/${_pkgname}-${_pkgver}/src
  sed -i 's/_INITIALIZE_EASYLOGGINGPP/INITIALIZE_EASYLOGGINGPP/' ./app/dialogs/mainwindow.cpp

  qmake rdm.pro
  make
}

package() {
  msg "copying files..."

  mkdir -p ${pkgdir}/usr/share/{applications,icons/hicolor/128x128/apps}
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  mkdir -p ${pkgdir}/usr/bin

  cd ${srcdir}/${_pkgname}-${_pkgver}/src
  sed -i -e "10s:/usr/share/${pkgname}/bin/rdm.png:rdm:" \
         -e "7s:share/${pkgname}/bin/rdm.sh:bin/rdm:" ./resources/rdm.desktop

  install -Dm 644 ./resources/rdm.desktop ${pkgdir}/usr/share/applications/
  install -Dm 644 ./resources/rdm.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/
  install -Dm 755 ../bin/linux/release/rdm ${pkgdir}/usr/bin/
  install -Dm 644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
# Maintainer : Alucryd <alucryd at gmail dot com>

pkgbase=purify
pkgname=purify
pkgver=02
pkgrel=2
arch=('i686' 'x86_64')
url="http://byuu.org/"
license=('GPL3')
source=("http://byuu.org/temp/purify_v02r01.tar.xz" "purify.desktop")
sha256sums=('0e3431b4d0d62be8e356887cc4bccfb68966790881df454cb80adc309c4e59b9'
            '5f24cc7884d19721b6f9ad14c14a98347de209a2791f4c830be83bd032f693f8')

# UI
_gtk=true
_qt=false

if [ "$_gtk" == true ] ; then
  pkgname+=('purify-gtk')
fi

if [ "$_qt" == true ] ; then
  pkgname+=('purify-qt')
fi

buildui() {
  make compiler=gcc platform=x link='-s -lX11 -ldl -lananke' phoenix=$1
  mv purify purify-$1
  make clean
}

installui() {
# cd "${srcdir}/bsnes_v091-source/purify"
  cd "${srcdir}/purify"
  install -Dm 755 purify-$1 "${pkgdir}/usr/bin/purify"
# install -m 755 "../../purify.sh" "${pkgdir}/usr/bin/purify-$1.sh"
# sed -i "s|_ui|$1|" "${pkgdir}/usr/bin/purify-$1.sh"
  install -dm 755 "${pkgdir}/usr/share/applications"
  install -m 644 "../../purify.desktop" "${pkgdir}/usr/share/applications/purify.desktop"
}

build() {
# cd "${srcdir}/bsnes_v091-source/purify"
  cd "${srcdir}/purify"

# QT 4.8.0 fix
  if [ _qt == true ] ; then
    moc -i -Iphoenix/qt/ -o phoenix/qt/platform.moc phoenix/qt/platform.moc.hpp
  fi

# Compile purify GTK GUI
  if [ $_gtk == true ] ; then
    buildui gtk
  fi

# Compile purify QT GUI
  if [ $_qt == true ] ; then
    buildui qt
  fi
}

package_purify-gtk() {
  pkgdesc="ROM purifier for the higan emulator - GTK GUI"
  depends=('gtk2' 'libananke')
  provides=("purify-ui=${pkgver}-${pkgrel}")
  conflicts=('purify-qt')

  installui gtk
}

package_purify-qt() {
  pkgdesc="ROM purifier for the higan emulator - QT GUI"
  depends=('qt>=4.7.0' 'libananke')
  provides=("purify-ui=${pkgver}-${pkgrel}")
  conflicts=('purify-gtk')

  installui qt
}

package_purify() {
  pkgdesc="ROM purifier for the higan emulator - Dummy package for AUR helpers"
  depends=("purify-ui>=${pkgver}-${pkgrel}")
}

pkgdesc="ROM purifier for the higan emulator"
depends=()

# vim: ts=2 sw=2 et :

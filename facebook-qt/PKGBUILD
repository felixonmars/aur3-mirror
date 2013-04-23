# Maintainer: Philipp 'TamCore' B. <philipp@tamcore.eu>

pkgname=facebook-qt
pkgver=LATEST
pkgrel=3
pkgdesc='‘Facebook Qt’ is the latest attempt at marrying the web’s most visited website with the traditional desktop OS'
url='https://github.com/TamCore/facebook-qt'
arch=('i686' 'x86_64')
license=('unknown')
depends=('qt4' 'qtwebkit')
source=('https://github.com/TamCore/facebook-qt/archive/master.zip' 'facebook-qt.desktop')
md5sums=('ff2d88ac4e1bb2fabb75e6c401ab1b25'
         'e5ad0f636267f93eadb11767fbea11c2')

build() {
  cd "${srcdir}/${pkgname}-master"
  qmake-qt4 Facebook.pro
  make
}

package(){
  cd "${srcdir}/${pkgname}-master"
  install -D -m755 Facebook "${pkgdir}"/usr/bin/facebook-qt
  install -D -m644 res/logo/facebook_logo.png "${pkgdir}"/usr/share/pixmaps/facebook-qt.png
  install -D -m644 "${srcdir}"/facebook-qt.desktop "${pkgdir}"/usr/share/applications/facebook-qt.desktop
}

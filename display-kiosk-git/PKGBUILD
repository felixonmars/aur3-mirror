#Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
#Developer: Niklas Fiekas 

pkgname=display-kiosk-git
pkgver=160.85c6709
pkgrel=1
pkgdesc="Display a website in a stripped down kiosk."
arch=("any")
url=("https://github.com/niklasf/display-kiosk")
license=("GPLv3")
depends=("qt4" "qtwebkit")
makedepends=("git" "gcc" "make")
source=("git+http://github.com/niklasf/display-kiosk")
md5sums=("SKIP")
install="display-kiosk-git.install"

pkgver() {
  cd display-kiosk
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/display-kiosk
  qmake-qt4 display-kiosk.pro
  make
}

package() {

  install -D -m644 "${srcdir}/display-kiosk/xinitrc" \
    "${pkgdir}/usr/share/doc/display-kiosk/xinitrc"

  install -D -m755 "${srcdir}/display-kiosk/display-kiosk" \
    "${pkgdir}/usr/bin/display-kiosk"

  install -D -m644 "${srcdir}/display-kiosk/README.md" \
    "${pkgdir}/usr/share/doc/display-kiosk/README.md"

  
}


# Maintainer: eayin2 <eayin2 at gmail dot com>
pkgname="weetray"
pkgver="0.1"
pkgrel=1
pkgdesc="A pytk tray-icon and notifier for weechat"
arch=('x86_64')
license=('GPL')
url="https://github.com/eayin2/weetray"
depends=("xosd" "weechat" "python2" "twisted" "pygtk" "python2-wnck" "xdotool" "screen" "kdebase-konsole" "python2-dbus" "python-elementtree" "python2-notify")
makedepends=('git')
source=("${pkgname}-${pkgver}"::'git://github.com/eayin2/weetray.git')
md5sums=('SKIP')
install='weetray.install'

pkgver() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 bin/weetray "${pkgdir}"/usr/bin/weetray
    install -Dm755 bin/weetray-icon "${pkgdir}"/usr/bin/weetray-icon
    install -d $pkgdir/usr/share/weetray/icons
    # Alternatively: mkdir -p $pkgdir/usr/{bin,share/weetray/icon
    for f in icons/*; do install -vD "$f" "${pkgdir}"/usr/share/weetray/icons;done
    for f in pygtk-icon/*; do install -vD "$f" "${pkgdir}"/usr/share/weetray;done
}

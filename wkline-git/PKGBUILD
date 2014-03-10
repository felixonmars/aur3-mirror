# -*- mode: sh -*-
# Maintainer: Kim Silkebækken <kim.silkebaekken+aur@gmail.com>

_gitname=wkline
_gitbranch=develop
pkgname="${_gitname}-git"
pkgdesc="WebKit-based status line for tiling window managers."
pkgver=190.77d14e9
pkgrel=1
url="https://github.com/Lokaltog/${_gitname}"
license=("MIT")
arch=("i686" "x86_64")
depends=("gtk3"
         "webkitgtk"
         "jansson")
optdepends=("alsa-lib: volume widget"
            "curl: external ip and weather widgets"
            "libdbus: notification daemon and battery status widgets"
            "libmpdclient: now playing/mpd widget"
            "libxcb: desktops and window title widgets"
            "xcb-util-wm: desktops and window title widgets")
makedepends=("git" "python")
backup=("etc/xdg/wkline/config.json")
install="${_gitname}.install"
source=("${_gitname}::git://github.com/Lokaltog/${_gitname}.git#branch=${_gitbranch}"
        "${install}")
sha256sums=("SKIP"
            "9103b23caf0427f2e88a2b1538d85b4a617e4a275cd17188a852d33aaffa0446")

pkgver() {
    cd "${_gitname}"
    echo "$(git rev-list --count ${_gitbranch}).$(git rev-parse --short ${_gitbranch})"
}

build() {
    cd "${_gitname}"
    ./waf configure build --prefix="/usr"
}

package() {
    cd "${_gitname}"
    ./waf install --destdir="${pkgdir}"
    install -Dm644 "docs/wkline.1" "${pkgdir}/usr/man/man1/wkline.1"
    install -Dm644 "docs/wkline.5" "${pkgdir}/usr/man/man5/wkline.5"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

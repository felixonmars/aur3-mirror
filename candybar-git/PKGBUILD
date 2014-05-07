# -*- mode: sh -*-
# Maintainer: Kim Silkebækken <kim.silkebaekken+aur@gmail.com>

_gitname=candybar
_gitbranch=develop
pkgname="${_gitname}-git"
pkgdesc="WebKit-based status bar for tiling window managers"
pkgver=396.8469d5e
pkgrel=1
url="https://github.com/Lokaltog/${_gitname}"
license=("MIT")
arch=("i686" "x86_64")
depends=("webkitgtk"
         "jansson")
optdepends=("alsa-lib: volume widget"
            "curl: external ip and weather widgets"
            "graphicsmagick: transparent background with effects"
            "i3ipc-glib: i3 desktops widget"
            "libdbus: notification daemon and battery status widgets"
            "libmpdclient: now playing/mpd widget"
            "libxcb: desktops and window title widgets"
            "playerctl: MPRIS media player widget"
            "xcb-util-wm: desktops and window title widgets")
makedepends=("git" "python" "wget" "asciidoc")
backup=("etc/xdg/candybar/config.json")
install="${_gitname}.install"
source=("${_gitname}::git://github.com/Lokaltog/${_gitname}.git#branch=${_gitbranch}"
        "${install}")
sha256sums=("SKIP"
            "85d9be3c86bdb40ce3cdcd374a83768caaec535726a80c8944a743da3192e177")

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
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

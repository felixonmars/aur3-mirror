# Maintainer:  cuihao <cuihao dot leo at gmail dot com>

_all_aur="n"
# If you want to use the possibly same packages from official repo, keep _all_aur="n".
# To use packages from AUR only, edit it as _all_aur="y".

pkgname=xfce4-devel-meta
pkgver=4.10
pkgrel=3
pkgdesc="Latest applications of Xfce (Meta package)"
arch=('any')
license=('GPL')
url="http://www.xfce.org/"

depends=(
    "gtk2-xfce-engine>=3.0.1"
    "thunar>=1.6.0"
    "xfce4-panel>=4.10.0"
    "xfce4-session>=4.10.0"
    "xfce4-settings-devel>=4.11.0"
    "xfdesktop>=4.10.0"
    "xfwm4>=4.10.0"
)

if [ $_all_aur = "y" ]; then
    true && depends=(
    "gtk-xfce-engine-devel>=3.0.1"
    "thunar-devel>=1.6.0"
    "xfce4-panel-devel>=4.10.0"
    "xfce4-session-devel>=4.10.0"
    "xfce4-settings-devel>=4.11.0"
    "xfdesktop-devel>=4.10.0"
    "xfwm4-devel>=4.10.0"
    )
fi

optdepends=(
    "terminal"
    "tumbler"
    "xfce4-appfinder"
    "xfce4-mixer"
    "xfwm4-themes"
)

conflicts=("xfce-utils")

build() {
    return 0
}

# vim:set ts=2 sw=2 et:

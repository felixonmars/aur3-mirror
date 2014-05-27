# Maintainer: James Polanco <jpolcol@gmail.com>
pkgname=hypermenu-git
pkgver=r11.c469bfa
pkgrel=1
pkgdesc="a dmenu-based TODO list manager, notes manager, calculator, xdg and weather menu"
arch=(any)
url="https://bitbucket.org/jpolcol/hypermenu"
license=('GPL3')
makedepends=('git')
depends=('bash' 'gawk' 'dmenu' 'dzen2' 'xorg-xdpyinfo' 'dnsutils')
optdepends=('calc: calculator support'
    'gtk-theme-switch2: gtk2 theme switching support'
    'archlinux-xdg-menu: applications menu support via XDG')
source=("$pkgname::git+https://jpolcol@bitbucket.org/jpolcol/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    make destdir="$pkgdir" prefix=/usr install
}

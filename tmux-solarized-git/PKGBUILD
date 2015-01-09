# Maintainer: Wesley Merkel <ooesili@gmail.com>
pkgname=tmux-solarized-git
pkgver=r23.g91c50cf
pkgrel=1
pkgdesc='A tmux solarized theme using Ethan Schoonover’s Solarized color scheme'
arch=('any')
url='https://github.com/seebi/tmux-colors-solarized'
license=('unknown')
depends=('tmux')
makedepends=('git')
install=install
source=("${pkgname}::git+https://github.com/seebi/tmux-colors-solarized")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    # install files
    mkdir -p $pkgdir/usr/share/tmux
    install -Dm644 tmuxcolors-256.conf $pkgdir/usr/share/tmux/solarized-256.conf
    install -Dm644 tmuxcolors-light.conf $pkgdir/usr/share/tmux/solarized-light.conf
    install -Dm644 tmuxcolors-dark.conf $pkgdir/usr/share/tmux/solarized-dark.conf
}

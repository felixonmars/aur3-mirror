# Maintainer: Pat Brisbin <pbrisbin@gmail.com>
pkgname=zsh-xrandr-completion
pkgver=0.0.1
pkgrel=1
pkgdesc='Improved zsh completion for xrandr'
arch=(any)
url='https://github.com/pbrisbin/zsh-xrandr-completion'
license=(GPL)
depends=(zsh)
source=('_xrandr')

package() {
  install -Dm644 _xrandr \
    "$pkgdir"/usr/share/zsh/site-functions/_xrandr
}
md5sums=('e4d39815770b00feb5b6ccafe60ed12c')

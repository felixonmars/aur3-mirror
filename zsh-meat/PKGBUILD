# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=zsh-meat
pkgver=1
pkgrel=1
pkgdesc="zsh completion for meat-git"
arch=('any')
url="https://github.com/e36freak/meat"
license=('custom')
depends=('meat-git' 'zsh')
source=(zsh-completion.zsh)

package() {
  cd "$srcdir"
  install -Dm644 "$srcdir/${source[0]}" "$pkgdir/usr/share/zsh/site-functions/_meat"
}

# vim:set ts=2 sw=2 et:
md5sums=('34d8627ba43ae68e5e6d1348d6ee19ab')

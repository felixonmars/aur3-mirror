# Maintainer: Robert Orzanna <orschiro at gmail dot com>

pkgname=dmenu-aliases
pkgver=1.5
pkgrel=1
pkgdesc="Run dmenu with custom aliases/functions stored in ~/.bash_aliases, ~/.bash_functions, ~/.zsh_aliases or ~/.zsh_functions"
arch=('any')
url="https://github.com/orschiro/orschiro-pkgbuilds/tree/master/dmenu-aliases"
license=('GPL')
depends=('dmenu')
source=('dmenu_run_aliases')
md5sums=('dfe09ff96edcb2e0385ad3738c4e88f2')

package() {
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/dmenu_run_aliases" "$pkgdir/usr/bin/dmenu_run_aliases"
}
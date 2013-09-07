# Submitter: Gianni Vialett <gianni at rootcube dot net>
# Maintainer: Pablo Olmos de Aguilera Corradini <pablo at glatelier dot org>

pkgname=gitignore-boilerplates
pkgver=1.0.1
pkgrel=3
pkgdesc='A shell script for easily accessing gitignore boilerplates from github.com'
arch=('any')
url='https://github.com/simonwhitaker/gitignore-boilerplates'
license=('custom:UNLICENSE')
makedepends=('git')
conflicts=('gitignore-git')
install=gitignore-boilerplates.install
source=("https://github.com/simonwhitaker/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f686f27f6e828664bc8857c9bc8ea3684ba01faf74897f8f0c3092caba1c998c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gibo "${pkgdir}/usr/bin/gibo"
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 gibo-completion.bash "${pkgdir}/usr/share/bash-completion/completions/gibo"
  install -Dm644 gibo-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_gibo"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Pablo Olmos de Aguilera Corradini <pablo at glatelier dot org>

_gitname=gitignore-boilerplates
pkgname=${_gitname}-git
pkgver=32.9b1a5f8
pkgrel=3
pkgdesc='A shell script for easily accessing gitignore boilerplates from github.com'
arch=('any')
url='https://github.com/simonwhitaker/gitignore-boilerplates'
license=('custom:UNLICENSE')
makedepends=('git')
provides=('gitignore-boilerplates')
conflicts=('gitignore-boilerplates')
install=${_gitname}-git.install
source=("${_gitname}::git://github.com/simonwhitaker/${_gitname}.git"
        "${install}")
sha256sums=('SKIP'
            'a26ff45bf7fee701d504dfc31dad84c09c3694de6b2b8ef32d73c654e7c1edca')

pkgver() {
  cd ${_gitname}
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 gibo "${pkgdir}/usr/bin/gibo"
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${_gitname}/UNLICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_gitname}/README.md"
  install -Dm644 gibo-completion.bash "${pkgdir}/usr/share/bash-completion/completions/gibo"
  install -Dm644 gibo-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_gibo"
}

# vim:set ts=2 sw=2 et:

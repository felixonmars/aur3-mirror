# Maintainer: Pablo Olmos de Aguilera Corradini <pablo at glatelier dot org>

pkgname=gibo-git
pkgver=20130211
pkgrel=1
pkgdesc='A shell script for easily accessing gitignore boilerplates from github.com'
arch=('any')
url='https://github.com/simonwhitaker/gitignore-boilerplates'
license=('custom:unlicense')
makedepends=('git')
provides=('gibo')
install=gibo-git.install

_gitroot=https://github.com/simonwhitaker/gitignore-boilerplates
_gitname=gibo

build() {
  cd "$srcdir"

  msg "Connecting to GIT repository $_gitroot..."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
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

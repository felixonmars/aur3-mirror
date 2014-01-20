# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=vim-dockerfile-git
pkgver=r25.150dea1
pkgrel=1
pkgdesc="Vim syntax file & snippets for Docker's Dockerfile"
arch=('any')
url="https://github.com/ekalinin/Dockerfile.vim"
license=('MIT')
depends=('vim')
makedepends=('git')

_gitroot=https://github.com/ekalinin/Dockerfile.vim
_gitname=dockerfile

pkgver() {
  cd "$srcdir/$_gitname-build"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm644 ./syntax/Dockerfile.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/Dockerfile.vim
  install -Dm644 ./ftdetect/Dockerfile.vim ${pkgdir}/usr/share/vim/vimfiles/ftdetect/Dockerfile.vim
  install -Dm644 ./snippets/Dockerfile.snippets ${pkgdir}/usr/share/vim/vimfiles/snippets/Dockerfile.snippets

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

#Maintainer: Anntoin Wilkinson <anntoin gmail com>
pkgname=vim-shareboard-git
pkgver=20130204
pkgrel=2
pkgdesc="Shareboard.vim is HTML preview software for vim"
arch=('any')
url="https://github.com/lambdalisue/shareboard.vim"
license=('MIT')
depends=('vim>=7.0' 'python2-shareboard' 'haskell-pandoc')
groups=('vim-plugins')
makedepends=('git')

_gitroot=https://github.com/lambdalisue/shareboard.vim.git
_gitname=shareboard.vim

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
}

package() {
  cd "$srcdir/$_gitname"

  installpath="$pkgdir/usr/share/vim/vimfiles"

  find {plugin,ftplugin} -type f \
    -exec install -Dm644 {} $installpath/{} \;

  # Change ftplugin files from name.vim to name_shareboard.vim
  # to prevent conflicts. See :help ftplugin-name
  rename '.vim' '_shareboard.vim' $installpath/ftplugin/*
}

# vim:set ts=2 sw=2 et:

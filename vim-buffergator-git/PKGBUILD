# Maintainer: Jianjun Mao <justmao945_at_gmail.com>

pkgname=vim-buffergator-git
pkgver=20121218
pkgrel=1
pkgdesc="Buffer listing, selection, and switching/navigation utility for vim"
arch=(any)
url="https://github.com/jeetsukumaran/vim-buffergator"
license=('custom')
depends=('vim')
groups=('vim-plugins')
conflicts=('vim-buffergator')
install='vimdoc.install'

_gitroot="https://github.com/jeetsukumaran/vim-buffergator.git"
_gitname="vim-buffergator"

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

  cd ${srcdir}/${_gitname}

  install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin} || return 1
  install -m644 doc/*.txt ${pkgdir}/usr/share/vim/vimfiles/doc/ || return 1
  install -m644 plugin/*.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/ || return 1
}


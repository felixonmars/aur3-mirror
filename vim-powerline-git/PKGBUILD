# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=vim-powerline-git
pkgver=20121011
pkgrel=1
pkgdesc="The ultimate vim statusline utility"
arch=('any')
url="https://github.com/Lokaltog/vim-powerline"
license=('custom:vim')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install

_gitroot="https://github.com/Lokaltog/vim-powerline.git"
_gitname="vim-powerline"

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

}

package() {
  cd "$srcdir/$_gitname"

  install -m644 -D plugin/Powerline.vim "${pkgdir}/usr/share/vim/vimfiles/plugin/Powerline.vim"
  install -m644 -D doc/Powerline.txt "${pkgdir}/usr/share/vim/vimfiles/doc/Powerline.txt"
  install -m644 -D autoload/Pl.vim "${pkgdir}/usr/share/vim/vimfiles/autoload/Pl.vim"
  cp -a autoload/Pl "${pkgdir}/usr/share/vim/vimfiles/autoload/"
  cp -a autoload/Powerline "${pkgdir}/usr/share/vim/vimfiles/autoload"
  find "${pkgdir}/usr/share/vim/vimfiles" -type f -exec chmod 644 {} \;

}


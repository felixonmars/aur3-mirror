# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-yajs-plugged-$(echo $USER | sha512sum | cut -c -128 | sha512sum | cut -c -8)-git
_gitname=yajs.vim
pkgver=20140715
pkgrel=1
pkgdesc="Yet Another JavaScript Syntax for Vim ($USER)"
arch=('any')
depends=('vim')
makedepends=('git')
optdepends=("vim-javascript-libraries-syntax-plugged-$(echo $USER | sha512sum | cut -c -128 | sha512sum | cut -c -8)-git: syntax for JS libraries")
groups=('vim-plugins')
url="https://github.com/othree/yajs.vim"
license=('custom:vim')
source=(git+https://github.com/othree/yajs.vim)
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd $_gitname
  git config remote.origin.url https://git::@${source##git+https://}.git
}

package() {
  cd $_gitname
  install -dm 755 "$pkgdir/$HOME/.vim/plugged/$_gitname"
  for _file in `ls -A`; do
    cp -dpr --no-preserve=ownership $_file "$pkgdir/$HOME/.vim/plugged/$_gitname"
  done
  find "$pkgdir" -mindepth 1 -maxdepth 1 -exec chown -R $USER:users '{}' \;
}

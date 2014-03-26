# Maintainer: Gently <toddrpartridge@gmail.com>
# alternate colorscheme collection: https://github.com/flazz/vim-colorschemes

pkgname=vim-colorschemes-noah
pkgver=0fd115b
pkgrel=1
pkgdesc="A Vim colorscheme collection by noah (256-color only)"
arch=('any')
url="https://github.com/noah/vim256-color"
license=('as-is' 'GPL' 'MIT' 'public-domain' 'vim')
depends=('vim')
makedepends=('git')
conflicts=('vim-colorsamplerpack' 'vim-colorschemes')
install="$pkgname".install

# For git: doesn't work (possibly because of its a submodule??... which I 
# don't know how to do
#makedepends=('git')
#source=('colors::git+https://github.com/noah/vim256-color.git')
#md5sums=('SKIP')

#pkgver() {
#  cd "$srcdir/repo"
#  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
#}

prepare () {
  _gitroot=git://github.com/noah/vim256-color.git
  _gitname=colors
  cd "$srcdir"/
  msg "Connecting to Git server..."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --recursive $_gitroot $_gitname
  fi
  msg "Git checkout done or server timeout"
  #git clone --recursive git://github.com/noah/vim256-color.git colors
}

package() {
  cd "$srcdir"/colors/
  install -dm755 "$pkgdir"/usr/share/vim/vimfiles/colors
  cp -L colors/* "$pkgdir"/usr/share/vim/vimfiles/colors/
}

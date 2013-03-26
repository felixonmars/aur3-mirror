# Maintainer: Fabio Zanini <fabio.zanini@fastmail.fm>
pkgname=vim-calendar-git
pkgver=20130326
pkgrel=2
pkgdesc="This script creates calendar windows in vim (GIT version)"
arch=('any')
url="https://github.com/mattn/calendar-vim"
license=('custom')
makedepends=('git')
depends=('vim')
groups=('vim-plugins')
install=vimdoc.install
source=(license.txt)
sha256sums=('4689a6d3ed3bca186ab8fea8360f32fdbb84f84c82fb21698390202efa7b7d19')

_gitroot=git://github.com/mattn/calendar-vim.git
_gitname=calendar-vim

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
  cd "$srcdir/$_gitname-build"

}

package() {
    cd "$srcdir/$_gitname-build"
    mkdir -p "${pkgdir}/usr/share/vim/vimfiles/"{autoload,doc,plugin}
    for x in {autoload,doc,plugin}; do
        install -m644 ${srcdir}/${_gitname}/$x/* ${pkgdir}/usr/share/vim/vimfiles/$x/
    done

    install -Dm755 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

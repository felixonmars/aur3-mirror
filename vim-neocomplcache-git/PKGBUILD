# Contributor: JWC <bulk @at jwcxz d0tcom>
pkgname=vim-neocomplcache-git
pkgver=20100820
pkgrel=1
pkgdesc="Ultimate auto-completion system for Vim"
arch=(any)
url="http://github.com/Shougo/neocomplcache"
license=('custom')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="http://github.com/Shougo/neocomplcache.git"
_gitname="neocomplcache"

build() {
  cd "$srcdir" msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  install -d ${pkgdir}/usr/share/vim/vimfiles
  cp -R --preserve=mode * ${pkgdir}/usr/share/vim/vimfiles

  # author doesn't provide any license file, though the plugin seems to be
  # under the MIT license

} 

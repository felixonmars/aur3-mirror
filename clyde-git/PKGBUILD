# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
pkgname=clyde-git
pkgver=20101027
pkgrel=1
pkgdesc="Next-generation libalpm/makepkg wrapper."
arch=('i686' 'x86_64')
url="http://clyde.archuser.com"
license=('custom')
depends=('lua-lzlib' 'lua-yajl-git' 'luasocket' 'luafilesystem' 'luasec')
makedepends=('git')
provides=('clyde' 'lualpm' 'lualpm-git')
conflicts=('clyde' 'lualpm' 'lualpm-git')

_gitroot="git://github.com/Kiwi/clyde.git"
_gitname="clyde"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

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

  make lualpm clyde || return 1
  make DESTDIR=${pkgdir} install_lualpm install_clyde || return 1
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
} 

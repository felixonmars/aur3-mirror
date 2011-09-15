pkgname=luaimap-git
pkgver=20110915
pkgrel=1
pkgdesc="A simple client-side library for IMAP4Rev1 servers written in lua"
arch=('any')
url="https://gitorious.org/luaimap"
license=('unknown')
makedepends=('git')

_gitroot="git://gitorious.org/luaimap/luaimap4.git"
_gitname="luaimap4"

build() {
  cd "$srcdir"
  if [ -d $_gitname ] ; then
    cd $_gitname
    git pull origin
  else
    git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"

  cd $srcdir
  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  mkdir -p ${pkgdir}/usr/share/lua/5.1/ || return 1
  cp -ax imap4 ${pkgdir}/usr/share/lua/5.1/ || return 1
  mkdir -p ${pkgdir}/usr/share/lua/5.1/imap4/examples || return 1
  cp -ax *.lua ${pkgdir}/usr/share/lua/5.1/imap4/examples/ || return 1
  sed -i 's#local path = "\./imap4/"#local path = "/usr/share/lua/5.1/imap4/"#' ${pkgdir}/usr/share/lua/5.1/imap4/init.lua || return 1
} 

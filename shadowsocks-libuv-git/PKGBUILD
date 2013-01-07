# Maintainer: YANG Yang                                                     
# Contributor: dndx
# Contributor: clowwindy

pkgname=shadowsocks-libuv-git
pkgver=20130107
pkgrel=2
pkgdesc="A lightweight tunnel proxy which can help you get through firewalls. A server port for shadowsocks, written in C."
arch=('i686' 'x86_64')
url="https://github.com/dndx/shadowsocks-libuv"
depends=('git')
license=("MIT License")

_gitroot="git://github.com/dndx/shadowsocks-libuv.git"
_gitname="shadowsocks-libuv"


build() {
  cd "${srcdir}"
  msg "Connecting to Git server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
    cd "${_gitname}"
    git submodule init
    git submodule update
fi

    msg "Start compiling......"
    make

}

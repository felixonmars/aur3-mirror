# Maintainer: YANG Yang                                                     
# Contributor: dndx
# Contributor: clowwindy

pkgname=shadowsocks-libuv
pkgver=0.1
pkgrel=1
pkgdesc="shadowsocks is a lightweight tunnel proxy which can help you get through firewalls."
arch=('i686' 'x86_64')
url="https://github.com/dndx/shadowsocks-libuv"
depends=('git')
license=("MIT License")

build() {
    git clone 'git://github.com/dndx/shadowsocks-libuv.git'
    cd shadowsocks-libuv
    git submodule init
    git submodule update
    make
}

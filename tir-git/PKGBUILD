# Maintainer: Josh Klar <j@iv597.com>
pkgname=tir-git
pkgver=20120910
pkgrel=1
pkgdesc="A Simple Lua Web Framework for Mongrel2"
arch=('any')
url="http://tir.mongrel2.org"
license=('custom')
depends=('mongrel2' 'lua' 'luajson' 'lua-md5' 'lua-zmq-git' 'lua-tnetstrings-git' 'lsqlite3' 'luaposix')
makedepends=('git' 'unzip' 'luarocks')

_gitroot="https://github.com/zedshaw/Tir.git"
_gitname="Tir"

package() {
    cd "$srcdir"
  
    if [ -d $_gitname ] ; then                                          
        cd $_gitname && git pull origin                                 
        msg "The local files are updated."                              
    else                                                                
        git clone $_gitroot $_gitname                                   
    fi                                                                  

    msg "GIT checkout done or server timeout" 
    
    cd $_gitname
    make build
    mkdir -p $pkgdir/usr/share/lua/5.1
    cp -a tir $pkgdir/usr/share/lua/5.1/
  }

# vim:set ts=2 sw=2 et:

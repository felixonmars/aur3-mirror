# Maintainer: Josh Klar <j@iv597.com>
pkgname=lua-zmq-git
pkgver=20120910
pkgrel=1
pkgdesc="Lua zeromq2 binding"
arch=('any')
url="http://github.com/Neopallium/lua-zmq"
license=('custom')
depends=('lua')
makedepends=('git' 'cmake')
provides=('lua-zmq')

_gitroot="https://github.com/Neopallium/lua-zmq.git"
_gitname="lua-zmq"

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
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
    make install DESTDIR=${pkgdir}
}

# vim:set ts=2 sw=2 et:

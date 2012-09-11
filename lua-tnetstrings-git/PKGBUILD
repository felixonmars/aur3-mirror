# Maintainer: Josh Klar <j@iv597.com>
pkgname=lua-tnetstrings-git
pkgver=20120910
pkgrel=1
pkgdesc="tnetstrings implementation in Lua"
arch=('any')
url="http://github.com/jsimmons/tnetstrings.lua"
license=('custom')
depends=('lua')
makedepends=('git')
provides=('lua-tnetstrings')

_gitroot="https://github.com/jsimmons/tnetstrings.lua.git"
_gitname="tnetstrings.lua"

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
    mkdir -p $pkgdir/usr/share/lua/5.1
    cp tnetstrings.lua $pkgdir/usr/share/lua/5.1/
  }

# vim:set ts=2 sw=2 et:

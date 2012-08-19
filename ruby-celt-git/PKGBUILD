# Maintainer: Josh Klar <j@iv597.com>
pkgname=ruby-celt-git
pkgver=20120818
pkgrel=1
pkgdesc="Ruby bindings to the CELT codec (SWIG)."
arch=('any')
url="http://celt-codec.org"
license=('custom')
depends=('ruby') 
makedepends=('swig')

_gitroot="git://iv597.com/ruby-celt"
_gitname="ruby-celt"

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
    cd celt
    swig -ruby -I/usr/include celt.i
    ruby ./extconf.rb
    make
    make install DESTDIR=${pkgdir}
}

# vim:set ts=2 sw=2 et:

# Contributor: Isaac Praveen <icylisper@gmail.com>
pkgname=jark
pkgver=20101003
pkgrel=2
pkgdesc="JARK is a tool to manage classpaths for clojure programs on a persistent JVM"
arch=any
url="http://github.com/icylisper/jark"
license=('APACHE LICENSE v2')
depends=()
makedepends=('git' 'leiningen') 
source=()

_gitroot="git://github.com/icylisper/jark.git"
_gitname="jark"

build() {
    cd ${srcdir}/
    msg "Connecting to the GIT server...."

    if [[ -d ${srcdir}/${_gitname} ]] ; then
         cd ${_gitname}
         git pull origin
         msg "The local files are updated..."
    else
         git clone ${_gitroot}
    fi
    cd ${srcdir}/${_gitname}/
    lein jar
    ./build
}

package() {
    cd ${srcdir}/${_gitname}/
    
    mkdir -p $pkgdir/usr/bin/
    cp -a jark $pkgdir/usr/bin/
}


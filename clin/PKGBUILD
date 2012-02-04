# Contributor: Isaac Praveen <icylisper@gmail.com>
pkgname=clin
pkgver=20100916
pkgrel=1
pkgdesc="A command line framework for clojure programs on the JVM"
arch=any
url="http://github.com/icylisper/clin"
license=('APACHE LICENSE v2')
depends=()
makedepends=('git' 'leiningen') 
source=()

_gitroot="git://github.com/icylisper/clin.git"
_gitname="clin"

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
    cp -a clin $pkgdir/usr/bin/
}


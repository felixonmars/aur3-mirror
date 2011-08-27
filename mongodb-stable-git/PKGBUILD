#Maintainer: David Lehmann <dtl@voxelbrain.com>
#Contributor: Sebastian Friedel <sef@voxelbrain.com>
#Contributor: Mathias Stearn <mathias@10gen.com>
pkgname=mongodb-stable-git
pkgver=20100103
pkgrel=1
pkgdesc="A high-performance, open source, schema-free document-oriented database."
arch=('i686' 'x86_64')
url="http://www.mongodb.org"
license=('AGPL')
makedepends=('git' 'scons')
depends=('boost' 'spidermonkey>=1.7.0-3' 'pcre' 'xulrunner')
provides=('mongodb')
conflicts=('mongodb')
backup=('etc/mongodb.conf')
source=('mongodb.rc' 'mongodb.conf')
install=${pkgname}.install
md5sums=('792607705dfb6358a871f8862e7b043d'
         'faf6e4f6e378cb1c1b0b8e85d6791988')

_gitroot="git://github.com/mongodb/mongo.git"
_gitname="mongo"
_gitbranch="v1.2"

build() {
    if [ -d ${srcdir}/${_gitname} ] ; then
        cd ${srcdir}/${_gitname} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_gitroot} || return 1
        cd ${srcdir}/${_gitname}
        msg "Switching branch to ${_gitbranch}"
        git checkout -b ${_gitbranch} origin/${_gitbranch} || return 1
    fi

    msg "GIT checkout done or server timeout"
    cd ${srcdir}
    rm -rf ${_gitname}-build
    git clone ${_gitname} ${_gitname}-build
    cd ${srcdir}/${_gitname}-build

    local SCONSFLAGS="${MAKEFLAGS}"
    scons all || return 1
    scons --prefix="${startdir}/pkg/usr" install || return 1
    install -Dm 755 "${startdir}/mongodb.rc" "${startdir}/pkg/etc/rc.d/mongodb" || return 1
    install -Dm 644 "${startdir}/mongodb.conf" "${startdir}/pkg/etc/mongodb.conf" || return 1
    install -dm 700 "${startdir}/pkg/var/lib/mongodb" || return 1

    if [ -d "${pkgdir}/usr/lib64" ] ; then
        mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib" || return 1
    fi
    
    msg "If upgrading from 1.0 don't forget to upgrade your db."
    msg "Upgrade db with: mongod --config /etc/mongodb.conf --upgrade"
}

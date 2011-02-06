# Contributor: Hristiyan Matev <hristiyan.matev@gmail.com>
pkgname=couchbeam-git
pkgver=20101002
pkgrel=1
pkgdesc="Erlang Couchdb kit"
arch=('i686' 'x86_64')
url="http://github.com/benoitc/couchbeam"
license=('Apache License 2.0')
depends=('erlang')
makedepends=('git')
conflicts=('couchbeam')
provides=('couchbeam')

_gitroot="git://github.com/benoitc/couchbeam.git"
_gitname="couchbeam"

build() {

    cd "$srcdir"
    msg "Connecting to GIT server..."
    
    if [ -d $_gitname ] ; then
       cd $_gitname && git pull origin
       msg "The local files are updated."
    else
       git clone $_gitroot
    fi

    msg "Starting make... :)"
    cd "$srcdir/$_gitname"
    make

    msg "Generating docs... :)"
    make doc

    cd "$srcdir"
    cp -r "$_gitname" "/usr/lib"
}	

# Maintainer: Louis R. Marascio <marascio@gmail.com>

pkgname=s3funnel-git
pkgver=20121126
pkgrel=1
pkgdesc="Multithreaded command line tool for Amazon's Simple Storage Service (S3)"
arch=('i686' 'x86_64')
url='http://github.com/sstoiana/s3funnel/'
license=('MIT')
depends=('python2' 'python-workerpool' 'python2-boto')
conflicts=('s3funnel')

_gitroot="git://github.com/sstoiana/s3funnel.git"
_gitname="s3funnel"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server..."

    if  [ -d $_gitname ]; then
        cd $_gitname && git pull origin
        msg "The local files are up to date"
        cd ..
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"

    rm -rf $_gitname-build
    cp -r  $_gitname $_gitname-build
    cd $_gitname-build

    /usr/bin/python2 setup.py build || return 1
}

package() {
    cd "$srcdir/$_gitname-build"
    /usr/bin/python2 setup.py install --root=$pkgdir || return 1
}

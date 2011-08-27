# Contributor: Facebook Inc. <http://developers.facebook.com>

pkgname=python2-facebook-sdk-git
pkgver=20110130
pkgrel=1
pkgdesc="Facebook Platform Python SDK."
arch=('any')
url="http://developers.facebook.com"
license=()
depends=('python2')
_gitroot='git://github.com/facebook/python-sdk.git'
_gitname='python-sdk'
source=()
md5sums=()

build() {
    msg 'Connecting to GIT server....'
    if [ -d '${srcdir}/${_gitname}' ] ; then
        cd ${_gitname} && git pull --rebase
    else
        git clone ${_gitroot}
    fi

    msg 'GIT checkout done or server timeout'
    if [ -d $_gitname-build ]; then
        msg 'Removing old build directory'
        rm -rf $_gitname-build
    fi

    msg 'Copying repository to another build directory'
    cp -r $srcdir/$_gitname $srcdir/$_gitname-build
    
    msg 'Starting build'
    cd $srcdir/$_gitname-build

    msg 'Running setup.py'
    python2 setup.py build || return 1
    python2 setup.py install --root=$pkgdir || return 1
}

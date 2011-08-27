# Contributor: Usware Technologies <www.uswaretech.com>

pkgname=django-socialauth-git
pkgver=20110129
pkgrel=1
pkgdesc="Allows logging via Facebook, Yahoo, Gmail, Twitter and Openid."
arch=('any')
url="https://github.com/uswaretech/Django-Socialauth"
license=('Custom')
depends=('django' 'python-openid>=2.0.0' 'python2-oauth')
optdepends=('python2-facebook-sdk: Facebook support')
_gitroot='git://github.com/uswaretech/Django-Socialauth.git'
_gitname='Django-Socialauth'
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

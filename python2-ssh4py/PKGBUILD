# Maintainer: Scott Garrett <wintervenom@gmail.com>

pkgname=python2-ssh4py
pkgver=20110827
pkgrel=2
pkgdesc="Python bindings for libssh2."
arch=('any')
url="https://github.com/wallunit/ssh4py"
license=('LGPL')
depends=('python2' 'libssh2' 'zlib')

_gitroot='git://github.com/wallunit/ssh4py.git'
_gitname='ssh4py'

build() {
    cd "$srcdir"
    msg 'Connecting to GIT server...'
    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg 'The local files are updated.'
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg 'GIT checkout done or server timeout.'
    cd "$srcdir/$_gitname"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_gitname"
    python2 setup.py install --prefix "${pkgdir}/usr" --optimize=1
}

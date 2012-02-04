# Maintainer: Scott Garrett <wintervenom@gmail.com>

pkgname=python-ssh4py
pkgver=20110827
pkgrel=1
pkgdesc="Python 3 bindings for libssh2."
arch=('any')
url="https://github.com/wallunit/ssh4py"
license=('LGPL')
depends=('python' 'libssh2' 'zlib')

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
    python3 setup.py build
}

package() {
    cd "$srcdir/$_gitname"
    python3 setup.py install --prefix "${pkgdir}/usr" --optimize=1
}

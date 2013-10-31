# Maintainer: Scott Garrett <mail@exovenom.net>

pkgname=dvdje-git
pkgver=20131030
pkgrel=2
pkgdesc="DV Dream Journal Exporter. Exports dream journals from Dream Views in original BBCode format."
arch=('any')
url="https://github.com/Wintervenom/dvdje"
depends=('python')
license=('GPL3')
makedepends=('python-setuptools')

_gitroot='git://github.com/Wintervenom/dvdje.git'
_gitname='dvdje'

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

    cd "${srcdir}/${_gitname}"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_gitname"
    python3 setup.py install --root "${pkgdir}/" --optimize=1
}

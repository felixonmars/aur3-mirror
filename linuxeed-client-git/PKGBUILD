pkgname=linuxeed-client-git
pkgver=20120709
pkgrel=1
pkgdesc="Client for http://linuxeed.org"
arch=('i686' 'x86_64')
url="http://dev.pztrn.ru/linuxeedclient"
license=('GPLv3')
depends=('python2' 'python2-distribute' 'python2-lxml' 'python2-pyqt')
makedepends=('git')
provides=('linuxeed-client')

_gitroot="git://git.pztrn.ru/linuxeed-client.git"
_gitname="purt"

build() {
    cd $srcdir

    msg "Connecting to GIT server..."
    if [[ -d ${_gitname} ]]; then
        (cd ${_gitname} && git pull origin)
    else
        git clone ${_gitroot} ${_gitname}
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    cd ${srcdir}/${_gitname}

    python2 setup.py build || exit 1
    python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1

	chmod +x ${pkgdir}/usr/bin/linuxeed-gui

    rm -rf ${_gitname}-build
}


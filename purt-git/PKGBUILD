pkgname=purt-git
pkgver=20120611
pkgrel=1
pkgdesc="PUrT - Python-powered Urban Terror server browser and launcher"
arch=('any')
url="http://dev.pztrn.ru/purt"
license=('MIT')
depends=('python2' 'python2-distribute' 'python2-lxml' 'python2-pyqt' 'qstat-svn')
makedepends=('git')
provides=('purt')

_gitroot="git://git.pztrn.ru/purt.git"
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

	chmod +x ${pkgdir}/usr/bin/purt

    rm -rf ${_gitname}-build
}


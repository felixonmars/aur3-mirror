# Maintainer: C Anthony Risinger
pkgname=pyjamas-git
pkgver=20101115
pkgrel=1
pkgdesc="Python Javascript Compiler, Desktop Widget Set and RIA Web Framework"
url=http://pyjs.org/
arch=(any)
license=(Apache2)
depends=(python2)
makedepends=(git setuptools)
optdepends=('pywebkitgtk-pythonwebkit: for PyJD (desktop app) support')
provides=(pyjamas)
source=()

_gitroot="git://pyjamas.git.sourceforge.net/gitroot/pyjamas/pyjamas"
_gitname="master"

build() {

    deploy=/usr/share/${pkgname}

    local g=${startdir}/${pkgname}.git w=${pkgdir}${deploy}
    mkdir -p ${w}
    if ! [ -d "${g}" ]; then
        git --git-dir=${g} --work-tree=${w} init
    fi  

    msg2 "Syncing with ${_gitroot}..."
    git --git-dir=${g} --work-tree=${w} fetch -fu ${_gitroot} +${_gitname}:${_gitname}
    msg2 "Initializing src tree..."
    git --git-dir=${g} --work-tree=${w} read-tree --reset -u ${_gitspec:-${_gitname}}

    cd ${w}

    msg2 "Using remote branch: origin/${_gitname}. Deploying..."
    python2 bootstrap.py ${deploy}/pyjs/src ${deploy} ${pkgdir}/usr &&
    python2 run_bootstrap_first_then_setup.py build &&
    python2 run_bootstrap_first_then_setup.py install --root=${pkgdir} ||
        return 1

}

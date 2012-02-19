# Maintainer: Doug Elkin <drelkin86@gmail.com>

_pkgname="pyjamas"
pkgname="${_pkgname}-no-hulahop-git"
pkgver=20120218
pkgrel=3
pkgdesc="Python Javascript Compiler, Desktop Widget Set and RIA Web Framework, using pywebkitgtk instead of hulahop/xpcom, and a couple other small fixes"
url=http://pyjs.org/
arch=(any)
license=(Apache2)
depends=(python2)
makedepends=(git setuptools)
optdepends=('pywebkitgtk: for PyJD (desktop app) support')
provides=(pyjamas)
install="${pkgname}.install"
source=("pyjamas-no-hulahop-git.diff" "pyjamas-buildall.diff")
md5sums=('e459c65ddbb247372cf0598767587dbd'
         '8818bc17dd1e7eeedfeaeb7f617171cd')

_gitroot="git://pyjs.org/git/pyjamas.git"
_gitname="master"

build() {

    deploy=/usr/share/${_pkgname}

    local g=${srcdir}/${_pkgname}.git w=${pkgdir}${deploy}
    mkdir -p ${w}
    if ! [ -d "${g}" ]; then
        git --git-dir=${g} --work-tree=${w} init
    fi  

    msg2 "Syncing with ${_gitroot}..."
    git --git-dir=${g} --work-tree=${w} fetch -fu ${_gitroot} +${_gitname}:${_gitname}
    msg2 "Initializing src tree..."
    git --git-dir=${g} --work-tree=${w} read-tree --reset -u ${_gitspec:-${_gitname}}

    cd ${w}
    msg2 "Swapping hulahop for webkit"
    patch -uN pyjd/__init__.py.in "${srcdir}/${pkgname}.diff"

    msg2 "Using remote branch: origin/${_gitname}. Deploying..."
    python2 bootstrap.py ${deploy}/pyjs/src ${deploy} ${pkgdir}/usr &&
    python2 run_bootstrap_first_then_setup.py build &&
    python2 run_bootstrap_first_then_setup.py install --root=${pkgdir} ||
        return 1

    cd $pkgdir
    patch -uN usr/share/pyjamas/examples/buildall.py "${srcdir}/pyjamas-buildall.diff"


}

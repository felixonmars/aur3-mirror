# Maintainer: Benjamin A. Shelton <zancarius at gmail _ com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

## !!! WARNING, PLEASE READ !!! ##
#
# python2-httpbin-git will be RENAMED to httpbin-git as per the Arch
# Python packaging guidelines since this is an application and
# not a library:
# https://wiki.archlinux.org/index.php/Python_Package_Guidelines
#
# Please install the package "httpbin-git" instead.
#
# I will continue maintaining this package for a few update
# cycles until December 1st, 2012, at which point this package
# WILL BE MERGED into httpbin-git.

pkgname=python2-httpbin-git
pkgver=20121105
pkgrel=1
pkgdesc="HTTP request and response service--useful for unit testing."
arch=(any)
url="https://github.com/kennethreitz/httpbin"
license=(MIT)
depends=(
    python2-argparse
    python2-blinker
    python2-decorator
    python2-flask
    python2-flask-script
    python2-gevent
    python2-jinja
    python2-newrelic
    python2-omnijson
    python2-raven
    python2-werkzeug
)
makedepends=(
    git
    python2-distribute
)
source=(
    depends.patch
)
md5sums=(
    8f2adccd7797e1bb198c840d0e4b3210
)

_gitroot="https://github.com/kennethreitz/httpbin.git"
_gitname="httpbin"

build () {
    
    cd "${srcdir}"
    
    if [ -d "${_gitname}/.git" ] ; then
        msg "Updating git repository..."
        (cd "${_gitname}" && git checkout setup.py && git pull)
    else
        msg "Cloning git repository..."
        git clone --depth=1 ${_gitroot} ${_gitname}
    fi

    cp -a "${_gitname}" "${_gitname}-work"
    
    cd "${_gitname}-work"

    msg "Applying depends.patch to correct setup.py dependencies..."

    patch -Np1 -i ../../depends.patch
    
    python2 setup.py install --root="${pkgdir}/"
    
}

package () {

    install -Dm0664 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
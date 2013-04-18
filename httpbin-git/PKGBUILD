# Maintainer: Benjamin A. Shelton <zancarius at gmail _ com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=httpbin-git
pkgver=20130416
pkgrel=1
pkgdesc="HTTP request and response service--useful for unit testing."
arch=(any)
url="https://github.com/kennethreitz/httpbin"
license=(MIT)
conflicts=(python2-httpbin-git)
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

}

package () {

    cd "${_gitname}-work"

    python2 setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm0664 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
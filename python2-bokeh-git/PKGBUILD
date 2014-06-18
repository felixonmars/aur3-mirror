# Maintainer: jokot3 <jokot3 at gmail dot com>
_pkgname=bokeh
pkgname=python2-${_pkgname}-git
#pkgver=0.2.r635.g692564e
#pkgver=0.4.2.r385.g345efb3
pkgver=0.4.4.r602.gc43f67a
pkgrel=3
pkgdesc="Interactive visualization library for large datasets that natively uses the latest web technologies"
arch=('any')
url="http://bokeh.pydata.org/"
license=('BSD')
depends=('python2-numpy' 'python2-flask' 'python2-pandas' 'python2-redis' 'python2-requests' \
         'python2-gevent' 'python2-gevent-websocket')
makedepends=('python2-setuptools' 'git')
optdepends=('ipython2: for notebook support'
'redis: redis backend for bokeh-server')
conflicts=('python2-bokeh')
provides=('python2-bokeh')
options=()
source=("git+https://github.com/ContinuumIO/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${_pkgname}"
    python2 setup.py install --root="$pkgdir/" --optimize=1

    install -Dd "$pkgdir/usr/share/$_pkgname"

    cp -r "examples" "$pkgdir/usr/share/$_pkgname/examples"
    sed -i 's;#!/usr/bin/env python;#!/usr/bin/env python2;' \
        "$pkgdir/usr/share/bokeh/examples/test"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # see https://mailman.archlinux.org/pipermail/aur-general/2013-November/026151.html
    cd "$pkgdir/usr/share/licenses/" && ln -s "$pkgname" "$_pkgname"

}

# vim:set ts=4 sw=4 et:

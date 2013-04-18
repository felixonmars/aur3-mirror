# Contributor: Lubosz Sarnecki <lubosz at gmail com>
# Contributor: Zack Buhman <zack@buhman.org>
# Maintainer: Krzysztof Malinowski <boromil@gmail.com>


pkgname=pypy-pyglet-hg
pkgver=20130415
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library for Python."
arch=(any)
url="http://pyglet.org"
license=('BSD')
depends=('pypy')
makedepends=('pypy-distribute' 'mercurial')
conflicts=('pypy-pyglet')
provides=('pypy-pyglet')
source=('hg+https://pyglet.googlecode.com/hg')
md5sums=('SKIP')

build() {
    cd "${srcdir}/hg"
    pypy setup.py build
}

package() {
    cd "${srcdir}/hg"
    pypy setup.py install --root="${pkgdir}" --optimize=1
}

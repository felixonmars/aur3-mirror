# Maintainer: Lubosz Sarnecki <lubosz at gmail com>

pkgname=pyglet-hg
pkgver=1.2alpha1.2774.f8da1dcafc85
pkgrel=1
pkgdesc="A cross-platform windowing and multimedia library for Python 3."
arch=(any)
url="http://pyglet.org"
license=('BSD')
depends=('python3')
makedepends=('python-distribute' 'mercurial')
conflicts=('pyglet')
provides=('pyglet')
source=("pyglet::hg+https://pyglet.googlecode.com/hg")
md5sums=("SKIP")

pkgver() {
	cd pyglet
	vers=$(grep ^VERSION setup.py | sed "s/VERSION = '//g" | sed "s/'//g")
    echo $vers.$(hg identify -n).$(hg identify -i)
}

build() {
	cd pyglet
	python setup.py build
}

package() {
	cd pyglet
	python setup.py install --root=$pkgdir --optimize=1
}

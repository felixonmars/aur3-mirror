# Contributor: Andrew Gallant <andrew@burntsushi.net>
# Maintainer: Andrew Gallant
pkgname=pywingo-git
_gitname=pywingo
pkgver=0.0.5
pkgrel=1
pkgdesc="Python library that communicates with wingo."
arch=('any')
url="https://github.com/wingowm/pywingo"
license=('WTFPL')
groups=()
makedepends=('git')
depends=('python2>=2.7')
source=('git://github.com/wingowm/pywingo.git')
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    # Use the tag of the last commit
    git describe --always | sed 's|-|.|g'
}

build() {
    return 0
}

package() {
    cd $_gitname
    python2 ./setup.py install --root=$pkgdir || return 1
}

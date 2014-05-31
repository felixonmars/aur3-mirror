# Maintainer: smradlev <smradlev@gmail.com>
pkgname=python2-srtmpy-git
_gitname=srtm.py
pkgver=80.db003a7
pkgrel=1
pkgdesc="Python geo elevation data parser for The Shuttle Radar Topography Mission data"
arch=('any')
url="https://github.com/tkrajina/srtm.py"
license=('Apache')
depends=('python2>=2.6 python2-gpxpy')
options=(!emptydirs)
source=("git://github.com/tkrajina/srtm.py.git")
md5sums=("SKIP")

pkgver() {
    cd "${_gitname}"
    # git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "${_gitname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


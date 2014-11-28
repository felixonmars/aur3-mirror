# Maintainer: Martin Wimpress <code@flexion.org>

_pkgname=plank-theme-orchis
pkgname=${_pkgname}-git
pkgver=3.918d29e
pkgrel=1
pkgdesc="Orchis Plank theme from the Moka Project."
arch=('any')
url="https://github.com/moka-project/_${pkgname}"
license=('GPL3')
depends=('plank')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=("${_pkgname}")
options=(!strip)
source=(${_pkgname}::"git+https://github.com/moka-project/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d -m 755 "${pkgdir}"/usr/share/plank/themes/{Orchis,Orchis-Glass}
    cp -dr --no-preserve=ownership "${_pkgname}"/{Orchis,Orchis-Glass} "${pkgdir}"/usr/share/plank/themes/
    find "${pkgdir}"/usr/share/plank/themes/ -type d -exec chmod 755 {} \;
    find "${pkgdir}"/usr/share/plank/themes/ -type f -exec chmod 644 {} \;
}

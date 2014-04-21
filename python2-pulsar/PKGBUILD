# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=python2-pulsar
_basename=pulsar
pkgver=0.8.1
pkgrel=1
pkgdesc="Concurrent python"
arch=('any')
url="http://quantmind.github.io/pulsar/"
license=('BSD')
depends=(
    'python2'
)
makedepends=()
optdepends=()
provides=('python2-pulsar')
replaces=()
options=(!emptydirs)
source=("https://github.com/quantmind/${_basename}/archive/${pkgver}.tar.gz")
md5sums=('71a2a497cca8538312fafe8a4e4530eb')

package() {
    cd "${srcdir}/${_basename}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:

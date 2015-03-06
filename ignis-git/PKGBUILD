# Maintainer : Vi Grey <development@pariahvi.com>

pkgname=ignis-git
pkgver=1.0.0.0
pkgrel=4
pkgdesc='A Console Based Password Management Program'
arch=('any')
url='https://github.com/DevBrush/ignis'
license=('BSD')
depends=('python>=3.0')
makedepends=('git')
source=("ignis::git+git://github.com/DevBrush/ignis")
sha512sums=('SKIP')

package() {
    cd ignis
    python setup.py install --root=${pkgdir}/ --optimize=1
    install -Dm644 "${srcdir}/ignis/docs/ignis.1.gz" "${pkgdir}/usr/share/man/man1/ignis.1.gz"
    install -Dm644 "${srcdir}/ignis/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

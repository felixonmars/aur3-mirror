# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=python-mccabe
_reponame=mccabe
pkgver=0.2.1
pkgrel=3
pkgdesc="McCabe complexity checker for Python"
arch=('any')
url="https://github.com/flintwork/mccabe"
license=('Expat')
depends=('python')
makedepends=('python-setuptools')
provides=('python-mccabe')
options=(!emptydirs)
source=("https://github.com/flintwork/${_reponame}/archive/${pkgver}.tar.gz")
md5sums=('fcba311ebd999f48359a8ab28da94b30')

package() {
    cd "${srcdir}/${_reponame}-${pkgver}"
    python setup.py install --root=${pkgdir}/ --prefix=/usr --optimize=1

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:

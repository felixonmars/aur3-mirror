# Maintainer: kpj <kpjkpjkpjkpjkpjkpj@gmail.com>
PACKAGER="kpj <kpjkpjkpjkpjkpjkpj@gmail.com>"

_pkgname="ploader"
_gitname="PLoader"

pkgname="python-$_pkgname-git"
pkgver=r127.99cc8c1
pkgrel=1
pkgdesc="A pure cli-based download manager"
arch=('any')
url="https://github.com/kpj/PLoader"
license=('MIT')
depends=('python' 'plowshare' 'unrar')
conflicts=('ploader')
provides=('ploader')
makedepends=('python-setuptools' 'git')
checkdepends=('python-nose')
source=('git+https://github.com/kpj/PLoader')
md5sums=('SKIP')


pkgver() {
    cd $_gitname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/$_gitname"

    python setup.py install --root="${pkgdir}"

    install -m755 -d "${pkgdir}/usr/share/licenses/python-ploader-git"
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/python-ploader-git/"
}

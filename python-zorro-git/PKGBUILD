# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>

pkgname=python-zorro-git
pkgver=20130310
pkgrel=1
pkgdesc="Network communication library based on greenlets, with zeromq and redis support. Git version."
arch=(any)
url="https://github.com/tailhook/zorro"
license=('custom')
depends=(
    'python'
    'python-greenlet'
    'zeromq'
)
makedepends=('git')
source=("${pkgname}::git+https://github.com/tailhook/zorro.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${srcdir}/${pkgname}
    python setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=4 sw=4 et:

# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>

pkgname=tilenol-git
pkgver=20130111
pkgrel=1
pkgdesc="Yet another tiling window manager. Git version."
arch=(any)
url="https://github.com/tailhook/tilenol"
license=('custom')
depends=(
    'python'
    'python-zorro-git'
    'python-cairo-git'
    'python-yaml'
    'xcb-proto'
)
makedepends=('git')
provides=('tilenol')
source=("${pkgname}::git+https://github.com/tailhook/tilenol.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${srcdir}/${pkgname}
    python setup.py install --root=${pkgdir}/ --optimize=1

    msg "Copying example config into /etc/xdg/tilenol..."
    cd examples
    mkdir -p "${pkgdir}/etc/xdg/tilenol"
    cp *.yaml "${pkgdir}/etc/xdg/tilenol"
}

# vim:set ts=4 sw=4 et:

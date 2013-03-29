# Maintainer: Simon Zimmermann <simon@insmo.com>

pkgname=pass
pkgver=1.4.2
pkgrel=11
pkgdesc='stores, retrieves, generates, and synchronizes passwords securely'
url=http://zx2c4.com/projects/password-store/
source=(http://git.zx2c4.com/password-store/snapshot/password-store-${pkgver}.tar.xz)
md5sums=('c6382dbf5be4036021bf1ce61254b04b')
provides=(pass)
conficts=(pass-git)
license='GPL2'
arch=('any')
depends=('xclip' 'bash' 'gnupg' 'pwgen' 'tree')
optdepends=('git')

build() {
    cd ${srcdir}/password-store-${pkgver}/
    make DESTDIR="${pkgdir}" install
}

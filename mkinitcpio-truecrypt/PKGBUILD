# Contributor: coolkehon [at] gmail . [c]o[m]
pkgname=mkinitcpio-truecrypt
pkgver=3
pkgrel=1
pkgdesc="Extensive hook for operations on a truecrypt encrypted root device"
url="http://www.truecrypt.org"
arch=(any)
license=('GPL')
install=${pkgname}.install
depends=(mkinitcpio truecrypt)
source=(truecrypt_hook truecrypt_install)

build() {
    install -o root -g root -D ${srcdir}/truecrypt_install ${pkgdir}/lib/initcpio/install/truecrypt
    install -o root -g root -D ${srcdir}/truecrypt_hook ${pkgdir}/lib/initcpio/hooks/truecrypt
}

sha512sums=('bff6d2b571ae8db9b87558ab3d020ebfdf782fc61d5f9ef28afc4f68c139b7afd8309cf1c232fa9cd5db4cd47d6694de1b5f0a1f8754de57b7abafc87ea5b05c'
            '021361f2ed8065f313f3ddba3808bdd04c6976c4e8d2aad65c00c3e36d43213a1409be2835c4c3ebf5f8a0cbd558526f2dc6e82b00f6f716700a1aa60a9e2991')


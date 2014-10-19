# Maintainer: <devfaz>

pkgname=dm-cache-rootfs
pkgver=0.0.2
pkgrel=1
pkgdesc="adds dm-cache-support to initrd"
arch=('any')
url="https://github.com/devfaz/arch-dm-cache-rootfs"
license=('GPL')
depends=('device-mapper' 'coreutils' 'kmod' 'systemd' 'lvm2')

source=(https://github.com/devfaz/arch-dm-cache-rootfs)
md5sums=('ee5ae84d115f051d87fcaaef3b4ae782')

install=$pkgname.install
source=('CHANGELOG.md' 'dm-cache_hook' 'dm-cache_install')
changelog='CHANGELOG.md'

build() {
    install -Dm644 "$srcdir/dm-cache_hook"      "$pkgdir/usr/lib/initcpio/hooks/dm-cache"
    install -Dm644 "$srcdir/dm-cache_install"   "$pkgdir/usr/lib/initcpio/install/dm-cache"
}

md5sums=(334131c4451cd7b87e710fcbeac540a8
c30b534d1f9e8dfa2723932fcb62ce66
341bdfd4dc9500120c0bc708c981d3b0
)

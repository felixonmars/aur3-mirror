# Maintainer: <devfaz>

pkgname=dm-cache-rootfs
pkgver=0.0.1
pkgrel=1
pkgdesc="adds dm-cache-support to initrd and cleans cache during shutdown"
arch=('any')
url="https://github.com/devfaz/arch-dm-cache-rootfs"
license=('GPL')
depends=('device-mapper' 'coreutils' 'kmod' 'systemd')

source=(https://github.com/devfaz/arch-dm-cache-rootfs)
md5sums=('ee5ae84d115f051d87fcaaef3b4ae782')

install=$pkgname.install
source=('CHANGELOG.md' 'disable-dm-cache.sh' 'dm-cache.service' 'dm-cache_hook' 'dm-cache_install')
changelog='CHANGELOG.md'

build() {
    install -Dm644 "$srcdir/dm-cache_hook"      "$pkgdir/usr/lib/initcpio/hooks/dm-cache"
    install -Dm644 "$srcdir/dm-cache_install"   "$pkgdir/usr/lib/initcpio/install/dm-cache"
    install -Dm644 "$srcdir/dm-cache.service"    "$pkgdir/usr/lib/systemd/system/dm-cache.service"
    install -Dm755 "$srcdir/disable-dm-cache.sh" "$pkgdir/usr/lib/systemd/scripts/disable-dm-cache.sh"
}

md5sums=('334131c4451cd7b87e710fcbeac540a8'
         'a8db28a09033379ca26ac91fe6a26949'
         '10c591c8445ae3a346031c80cf153ea6'
         'b355da7049d1a4797f0ca64811caa9c3'
         '09eca638d0f3de9c6cf5dcc0c409b118')

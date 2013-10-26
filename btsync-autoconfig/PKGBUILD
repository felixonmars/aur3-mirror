# Maintainer: Emil Lundberg <lundberg.emil@gmail.com> (AUR: Lorde; GitHub: emlun)
# Contrib Repo: https://github.com/emlun/bittorrent-sync
#
# Contributor: Justin Patera serialhex@gmail.com

pkgname=btsync-autoconfig
pkgver=1.1.0
pkgrel=2
pkgdesc="Create default config files when launching btsync@user, if necessary"
arch=('any')
url='https://github.com/emlun/bittorrent-sync'
license=('GPL')
replaces=('bittorrent-sync')
install="${pkgname}.install"
changelog='changelog.txt'
source=("${pkgname}.install"
        'btsync-autoconfig@.service'
        'btsync-makeconfig.sh'
        'btsync-autoconfig.sh'
        'btsync.conf.doc')
sha256sums=('8e01e865795c38303202648f3ef4290787a7beb943b04244ecefd3fb822e2c65'
            '23e98ca6cc14157ba14b2c408417c82aa6deda823667e5ba2500a2b48d28e404'
            'cd4ebe86fdb987889a22fa17d2fb5a4c4657b386453b88e12be16281f19d383a'
            '133f1dc66ac030a370387dbf0940cfeb04b4b619cb05861a64ff588f3c14aa40'
            'de4f2a124d56ddbaec23535a250dbe9001606f47b74f3c3c97056107b21c7f6e')

package() {
    cd "${srcdir}"

    install -D -m 644 btsync.conf.doc "${pkgdir}/usr/share/${pkgname}/btsync.conf.doc"
    install -D -m 644 btsync-makeconfig.sh "${pkgdir}/usr/share/${pkgname}/btsync-makeconfig.sh"
    install -D -m 644 btsync-autoconfig@.service "${pkgdir}/usr/lib/systemd/system/btsync-autoconfig@.service"
    install -D -m 644 btsync-autoconfig.sh "${pkgdir}/usr/share/${pkgname}/btsync-autoconfig.sh"
}

# vim: ts=4:sw=4:et

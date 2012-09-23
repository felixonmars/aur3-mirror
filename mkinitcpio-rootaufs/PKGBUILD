pkgname='mkinitcpio-rootaufs'
pkgver=1.2
pkgrel=2
pkgdesc='hook to setup an aufs root file system'
url='https://github.com/fandrieu/archlinux-aur/'
arch=('any')
license=('BSD')
install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0' 'aufs3')
source=('rootaufs_hook' 'rootaufs_install')

build() {
    install -o root -g root -D ${srcdir}/rootaufs_install ${pkgdir}/usr/lib/initcpio/install/rootaufs
    install -o root -g root -D ${srcdir}/rootaufs_hook ${pkgdir}/usr/lib/initcpio/hooks/rootaufs
}

md5sums=('9475d043e09127af9f25892dbd33f3f3'
         '2bb3dd00df1e05afb3216c0f662eea3d')

# Contributor: C Anthony Risinger
# Contributor: Michael Goehler


pkgname='mkinitcpio-btrfs-git'
pkgver=r45.94ee625
pkgrel=1
pkgdesc='mkinitcpio hook containing advanced features for btrfs-based root devices'
url='https://github.com/xtfxme/mkinitcpio-btrfs'
arch=('any')
license=('BSD')
#FIXME: howto handle this?
#ERROR: install file (mkinitcpio-btrfs-git.install) does not exist.
#install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0' 'btrfs-progs' 'kexec-tools')
provides=('mkinitcpio-btrfs')
conflicts=('mkinitcpio-btrfs')
backup=('etc/default/btrfs_advanced')
source=('git+https://github.com/xtfxme/mkinitcpio-btrfs#branch=master')
md5sums=('SKIP')


pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}


package() {
    cd "${srcdir}/${pkgname%-git}"
    install -o root -g root -D btrfs_install ${pkgdir}/usr/lib/initcpio/install/btrfs_advanced
    install -o root -g root -D btrfs_hook    ${pkgdir}/usr/lib/initcpio/hooks/btrfs_advanced
    install -o root -g root -D btrfs_config  ${pkgdir}/etc/default/btrfs_advanced
}

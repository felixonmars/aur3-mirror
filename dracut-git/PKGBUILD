# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>
_pkgname=dracut
pkgname=dracut-git
pkgver=038.r61.g7e50abf
pkgrel=1
pkgdesc="Generic, modular, cross-distribution initramfs generation tool"
arch=('i686' 'x86_64')
url="https://dracut.wiki.kernel.org/"
license=('GPL' 'LGPL')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('bash' 'coreutils' 'cpio' 'hardlink' 'kbd' 'kmod' 'libcap' 'procps-ng' 'systemd' 'xz')
optdepends=('bcache-tools' 'bootchart' 'bridge-utils' 'btrfs-progs' 'busybox' 'cifs-utils' 'cryptsetup' 'dash' 'device-mapper' 'dhclient' 'dmraid' 'dosfstools' 'e2fsprogs' 'hmaccalc' 'iproute2' 'iputils' 'lvm2' 'mdadm' 'multipath-tools' 'nbd' 'net-tools' 'nss' 'open-iscsi' 'pigz' 'plymouth' 'prelink' 'rpcbind')
makedepends=('asciidoc' 'docbook-xsl' 'git')
backup=('etc/dracut.conf')
options=(!makeflags !buildflags)
changelog=Changelog
source=("git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
        'remove_rsyncable.patch')
md5sums=('SKIP' '45a44a844efb2f4a52576c242c233911')

pkgver() {
    cd "$srcdir/$_pkgname"
    # Use the tag of the last commit
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    # gzip in Arch doesn't support --rsyncable flag
    patch < ../remove_rsyncable.patch
}

build() {
    cd "$srcdir/$_pkgname"
    ./configure  \
        --sysconfdir=/etc \
        --systemdsystemunitdir=/usr/lib/systemd/system
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="${pkgdir}" install

    # documentation
    local docdir="${pkgdir}/usr/share/doc/${_pkgname}"
    install -dm 755 "${docdir}"
    install -m 644 \
        AUTHORS \
        HACKING \
        README* \
        TODO \
        dracut.{html,png,svg} \
        "${docdir}"

    cd "$pkgdir"
    # remove compatibility wrappers we don't need
    rm -f usr/bin/mkinitrd*
    rm -f usr/share/man/man8/mkinitrd*
} 


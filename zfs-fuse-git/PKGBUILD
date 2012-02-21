# Contributor: Dmitrij Yu. Naumov
# Contributor: Stefano Zamprogno <mie-dot-iscrizioni-at-gmail-dot-com>
# Contributor: Thanks to Blind (nick from aur) for zfs-fuse rc.d daemon

pkgname=zfs-fuse-git
pkgver=20120221
pkgrel=1
pkgdesc="A port of the ZFS filesytem to the FUSE framework."
arch=("i686" "x86_64")
url="http://zfs-fuse.net/"
license=('CDDL')
depends=('glibc' 'fuse' 'zlib' 'libaio')
makedepends=('git' 'scons')
options=('zipman' '!strip')
conflicts=('zfs')
replaces=('zfs-fuse')
backup=('etc/zfs/zfsrc' 'etc/zfs/zfs_pool_alert' 'etc/conf.d/zfs-fuse')
source=('zfs-fuse.rcd'
        'zfs-fuse.confd'
        'Update-type-qualifier-for-glibc-2.14.patch'
       )

md5sums=('1efc3d817f200a86f89b33232c326e15'
         'c1282d490e1fb5af2fe8210efdcceae1'
         '3f5ca657d1a5c63a520c7168b1508e32'
        )

#_gitroot="http://git.zfs-fuse.net"
_gitroot="git://zfs-fuse.sehe.nl/git/sehe"
_gitname=official

build() {

    cd ${srcdir}
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone -b testing "$_gitroot" $_gitname
    fi

    msg "GIT checkout done or server timeout"

    rm -rf ${srcdir}/${_gitname}-build
    git clone --local ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

    msg "Apply patch(es)..."

    cd ${srcdir}/${_gitname}-build
    #git checkout testing
    git reset --hard HEAD

    patch -p0 < ${startdir}/Update-type-qualifier-for-glibc-2.14.patch

    msg "Starting make..."

    cd ${srcdir}/${_gitname}-build/src

    scons || return 1
    scons install \
        install_dir=${pkgdir}/usr/sbin \
        man_dir=${pkgdir}/usr/share/man/man8 \
        cfg_dir=${pkgdir}/etc

    # delete misplaced zfs_pool_alert file
    rm -f ${pkgdir}/etc/zfs_pool_alert

    install -D -m755 ${startdir}/zfs-fuse.rcd ${pkgdir}/etc/rc.d/zfs-fuse
    install -D -m644 ${startdir}/zfs-fuse.confd ${pkgdir}/etc/conf.d/zfs-fuse
    install -D -m644 ${srcdir}/${_gitname}-build/contrib/zfsrc ${pkgdir}/etc/zfs/zfsrc
    install -D -m644 ${srcdir}/${_gitname}-build/contrib/zfs_pool_alert ${pkgdir}/etc/zfs/zfs_pool_alert
    install -D -m644 ${srcdir}/${_gitname}-build/contrib/zfs_completion.bash \
        ${pkgdir}/etc/bash_completion.d/zfs_completion
}

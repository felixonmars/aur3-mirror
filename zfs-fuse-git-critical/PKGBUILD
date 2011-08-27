# Maintainer: Jochen Keil <jochen dot keil at gmail dot com>
# Contributor: Mark Nikkel <mnikkel@gmail.com>
# Contributor: Michael Stephens <michaeljs@gmail.com>
pkgname=zfs-fuse-git-critical
pkgver=20100406
pkgrel=1
pkgdesc="A port of the ZFS filesytem to the FUSE framework."
arch=('i686' 'x86_64')
url="http://zfs-fuse.net/"
license=('CDDL')
depends=('glibc' 'fuse' 'zlib' 'libaio')
makedepends=('git' 'scons')

_gitroot="http://git.zfs-fuse.net/official"
_gitname="zfs-fuse.git"

source=(zfs-fuse.rcd zfs-fuse.confd)

install=zfs-fuse.install

md5sums=('7defbcdc3464aad5b3f8e8ceebb86adc'
         'c1282d490e1fb5af2fe8210efdcceae1')

build() {

if [ -d ${startdir}/src/${_gitname} ] ; then
  cd ${_gitname}
  git pull origin
  git checkout critical
else
  git clone -b critical ${_gitroot} ${_gitname}
fi

  cd ${startdir}/src/${_gitname}
  cd src
  scons || return 1
  scons install install_dir=${pkgdir}/usr/sbin
  install -D -m755 ${startdir}/zfs-fuse.rcd ${pkgdir}/etc/rc.d/zfs-fuse
  install -D -m644 ${startdir}/zfs-fuse.confd ${pkgdir}/etc/conf.d/zfs-fuse
  install -D -m644 ${startdir}/src/${_gitname}/doc/zdb.8.gz ${pkgdir}/usr/share/man/man8/zdb.8.gz
  install -D -m644 ${startdir}/src/${_gitname}/doc/zfs.8.gz ${pkgdir}/usr/share/man/man8/zfs.8.gz
  install -D -m644 ${startdir}/src/${_gitname}/doc/zpool.8.gz ${pkgdir}/usr/share/man/man8/zpool.8.gz
}

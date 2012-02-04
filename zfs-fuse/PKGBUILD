# Maintainer: Jochen Keil <jochen dot keil at gmail dot com>
# Contributor: Mark Nikkel <mnikkel@gmail.com>
# Contributor: Michael Stephens <michaeljs@gmail.com>
pkgname=zfs-fuse
pkgver=0.7.0
pkgrel=5
pkgdesc='A port of the ZFS filesytem to the FUSE framework.'
arch=('i686' 'x86_64')
url="http://zfs-fuse.net/"
license=('CDDL')
depends=('glibc' 'fuse' 'zlib' 'libaio')
makedepends=('scons')
options=('zipman')
replaces=('zfs-fuse' 'zfs-fuse-git-critical')
backup=('etc/zfs/zfsrc' 'etc/zfs/zfs_pool_alert' 'etc/conf.d/zfs-fuse')
source=('zfs-fuse.rcd' 'zfs-fuse.confd' 'malloc.c.patch')
install=zfs-fuse.install
_official_src="official_src.tgz"
_official_src_url='http://gitweb.zfs-fuse.net/?p=official;a=snapshot;h=maint;sf=tgz'

md5sums=('ee9ee4035f02ca35d6323a727c471bd1'
         'c1282d490e1fb5af2fe8210efdcceae1'
         '73982d25d37503dcabb56d099d9356ba')

fetch_src() {
  if [ ! -f ${_official_src} ]; then
    wget -c \
      -O ${_official_src} \
      ${_official_src_url}
  fi
}

build() {
  # unfortunately this is necessary since gitweb produces tarballs with
  # different md5 sums every time

  while ( !(gzip -t ${_official_src} 2>&1 >/dev/null)); do
    rm -f ${_official_src};
    fetch_src;
  done

  [ -d ${srcdir}/official ] || mkdir ${srcdir}/official

  tar xzf ${_official_src} --strip 1 -C ${startdir}/src/official \
    || return 1

  cd ${srcdir}/official/src

  patch -p0 < ${srcdir}/malloc.c.patch

  scons || return 1
  scons install \
    install_dir=${pkgdir}/usr/sbin \
    man_dir=${pkgdir}/usr/share/man/man8 \
    cfg_dir=${pkgdir}/etc

  # delete misplaced zfs_pool_alert file
  rm -f ${pkgdir}/etc/zfs_pool_alert

  install -D -m755 ${startdir}/zfs-fuse.rcd ${pkgdir}/etc/rc.d/zfs-fuse
  install -D -m644 ${startdir}/zfs-fuse.confd ${pkgdir}/etc/conf.d/zfs-fuse
  install -D -m644 ${srcdir}/official/contrib/zfsrc ${pkgdir}/etc/zfs/zfsrc
  install -D -m644 ${srcdir}/official/contrib/zfs_pool_alert ${pkgdir}/etc/zfs/zfs_pool_alert
  install -D -m644 ${srcdir}/official/contrib/zfs_completion.bash \
    ${pkgdir}/etc/bash_completion.d/zfs_completion
}

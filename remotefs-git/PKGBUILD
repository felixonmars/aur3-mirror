#Maintainer: Jakub Lansky <jakub@lansky.biz> 

pkgname=remotefs-git
pkgver=20130901
pkgrel=5
pkgdesc="remotefs is a network file system designed for use with home NAS. Simple to use, few dependencies, reasonable security, completely in user space."
arch=(i686 x86_64)
license=('GPL')
url="http://remotefs.sourceforge.net"
depends=('fuse')
makedepends=('fuse' 'git')
conflicts=('remotefs' 'remotefs-svn')
backup=('etc/rfs-exports' 'etc/default/rfsd')
source=(werror.patch
	rfsd)
sha1sums=('931d9fa056ef352d222fd2acfce120690645feb7'
	'230f31b5994783adb629cc5d621def9ba6c7c889')

_giturl="git://git.code.sf.net/p/remotefs/git"
build() {
  cd "${srcdir}"

  msg "Connecting to $_giturl ..."
  git clone $_giturl remotefs-git|| return 1
  msg "Git clone done or server timeout"

  cd "${srcdir}/remotefs-git"

	patch -p1 < ../werror.patch

	make release -j1
}

package() {
	cd "${srcdir}/remotefs-git"
	install -d "${pkgdir}/usr"
	make INSTALL_DIR="${pkgdir}/usr" install

	install -d "${pkgdir}/usr/bin"
	install "build/sbin/mount.rfs" "${pkgdir}/usr/bin"
	install "build/sbin/rfsnsswitch.sh" "${pkgdir}/usr/bin"
	install "build/sbin/umount.fuse.rfs" "${pkgdir}/usr/bin"
	
	install -d "${pkgdir}/etc/default"
	install -m 600 "build/etc/rfs-exports" "${pkgdir}/etc"
	install -m 600 "build/debian/default/rfsd" "${pkgdir}/etc/default"
	
	install -d "${pkgdir}/etc/rc.d"
	install "../rfsd" "${pkgdir}/etc/rc.d/rfsd"
}

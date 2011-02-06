# Contributor: Rorschach <r0rschach@lavabit.com>

pkgname=multicd.sh
pkgver=5.2
pkgrel=1
pkgdesc="Skript for creating multiboot CDs."
url="http://multicd.tuxfamily.org"
arch=('i686' 'x86_64')
license="GPL"
depends=('syslinux' 'cdrkit')
optdepends=('dialog: Choosing Slax modules.')
source=(ftp://downloads.tuxfamily.org/multicd/multicd-$pkgver-nosyslinuxincluded.tar.gz multicd.sh.patch plugins.patch)
md5sums=('07a5698d7f2b8c54663532780c632ee3' '4cca0dba5d2d49a989b78769dde1da35' '0c679990bd6734baa027b5e669ba43b1')

build() {
	cd $srcdir
	# Makes multicd.sh compatible with our archlinux setup
	patch -p0 < multicd.sh.patch
	# Adds finnix support, and fixes an error in the gparted plugin
	patch -p0 < plugins.patch
	install -Dm755 $srcdir/multicd.sh $pkgdir/usr/bin/multicd.sh
	install -dm755 $pkgdir/usr/share/multicd.sh/plugins
	install -Dm755 $srcdir/plugins/* $pkgdir/usr/share/multicd.sh/plugins/
	install -Dm644 $srcdir/combine.sh $pkgdir/usr/share/multicd.sh/
	install -Dm644 $srcdir/changelog.txt $pkgdir/usr/share/multicd.sh/
}

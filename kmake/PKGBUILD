# Contributor: Stian Andreassen <hotstian at hotmail.com>
pkgname=kmake
pkgver=0.1
pkgrel=1
pkgdesc="A automatic Kernel build shell script"
depends=(glibc gcc make ncurses grub)
url="http://www.w4n.org"
source=(kmake)
md5sums=('6096303df190a5255cca30c15da2ec9f')

build(){
	mkdir $startdir/pkg/usr  $startdir/pkg/usr/sbin
	cp $startdir/src/kmake $startdir/pkg/usr/sbin
	chmod 755 $startdir/pkg/usr/sbin/kmake
}

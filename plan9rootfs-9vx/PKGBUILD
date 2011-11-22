# Contributor: Jens Staal <staal1978@gmail.com>

pkgname="plan9rootfs-9vx"
pkgver="2011.11.21"
pkgrel=1
pkgdesc="Plan9 base system to be run under vx32+union mounts"
url='http://plan9.bell-labs.com/plan9/'
arch=('i686' 'x86_64')
license=('LPL')
depends=('9vx-hg' 'unionfs-fuse')
makedepends=('fuseiso' 'plan9port')
source=('plan9user' 'plan9glenda')
md5sums=('85091028a8cdc0bf014ba4aabdd20a05' 'd35b3036e27ac9120a19dbe5de77f196')
_new=('no') 
# to avoid re-downloading iso every time the PKGBUILD changes
# _new=yes a signal for downloading the iso from Bell Labs.
# wget in build() is used to avoid the problem with daily obsolete md5sums
# Making sure that plan9port bunzip is available
PLAN9=/opt/plan9
PATH=$PATH:$PLAN9/bin

build() {
cd $srcdir
  if [ ${_new} = yes ]; then
	msg "getting the daily snapshot of the Plan9 iso from Bell labs"
	msg2 "deleting old iso file"
	rm plan9.iso
	msg2 "getting new compressed iso file" 
	wget http://plan9.bell-labs.com/plan9/download/plan9.iso.bz2
# using plan9port bunzip since the GNU version sometimes do strange things to the Plan9 iso
	9 bunzip2 plan9.iso.bz2
	msg2 "unpacking iso done"
	mkdir -p $srcdir/temp
  else
	msg "rebuilding with the same iso"
	mkdir -p $srcdir/temp
fi
  msg2 "mounting Plan9 iso"
  fuseiso plan9.iso $srcdir/temp
}

package() {
  mkdir -p "$pkgdir/opt/vx32/plan9root"
  mkdir -p "$pkgdir/usr/bin"
  cp -ar $srcdir/temp/ $pkgdir/opt/vx32/plan9root/
  msg "unmounting Plan9 iso"
  fusermount -u $srcdir/temp
  install -m755 $srcdir/{plan9user,plan9glenda} $pkgdir/usr/bin/
}

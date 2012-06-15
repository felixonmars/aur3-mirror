#Maintainer: Dawid Wrobel <dawid@klej.net>

pkgname=delldiagnostics
pkgver=1344A0
pkgrel=2
pkgdesc="Dell 32 bit Diagnostics and MpMemory utilities (GUI version, Multi System)"
arch=(i686)
url="http://support.us.dell.com/support/downloads/download.aspx?c=us&l=en&s=gen&releaseid=R199155&formatcnt=2&libid=0&fileid=275536"
depends=(syslinux)
makedepends=(unzip libstdc++5)
source=(http://ftp.us.dell.com/diags/CL${pkgver}.bin)
install=delldiagnostics.install
license=("custom")
md5sums=('18d868e29f70043461ae2f31ffd2dd59')

build() {
   cd $startdir/src
   sed -e '0,/^BEGIN OF FILE STORAGE/D' < CL${pkgver}.bin > contents.zip
   unzip -u -q contents.zip
   chmod a+x MKIMAGE
   mv BOOT Boot
   mv DIAGS Diags
   ./MKIMAGE DD.CFG HDD -i diags.bin
   install -m644 -D diags.bin $startdir/pkg/boot/delldiags/diags.bin
   install -m644 -D $startdir/license.txt $startdir/pkg/usr/share/licenses/delldiags/license.txt
}




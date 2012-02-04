# Contributor: Ole Roeßler <ole.roessler@gmail.com>

pkgname=xawtv-snapshot
pkgver=20081014
pkgrel=1
pkgdesc="xawtv 4 snapshot, with dvb support"
arch=('i686' 'x86_64')
url="http://linux.bytesex.org/xawtv/"
license=('GPL')
depends=('libjpeg' 'alsa-lib' 'lesstif' 'libdv' 'zvbi' 'aalib' 'libv4l'
         'libxxf86dga' 'libfs' 'libxrandr' 'libxinerama' 'libxv' 'libxaw'
	 'libxxf86vm' 'libgl' 'gpm' 'lirc-utils' 'libxft' 'zvbi'
	 'libmpeg2' 'libmad')
makedepends=('mesa')
options=('!makeflags' '!strip')
conflicts=('xawtv')
source=(http://dl.bytesex.org/cvs-snapshots/xawtv-20081014-100645.tar.gz)
md5sums=('d92280bfa753b584547ca79d8186e645')
        
build() {
  cd $srcdir/xawtv
  unset LDFLAGS
  ./autogen.sh
  ./configure --prefix=/usr --datadir=/usr/share --mandir=/usr/share/man 
  make || return 1
  make DESTDIR=$pkgdir resdir=$pkgdir/usr/lib/X11 install
}

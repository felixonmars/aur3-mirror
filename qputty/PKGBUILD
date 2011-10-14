#maitainer Meow < meow at linux at cn >
pkgname=qputty
pkgver=320.9027
pkgrel=1
pkgdesc='QT4 port for putty, a free telnet/ssh client'
arch=('i686' 'x86_64')
license=('GPL')
url='http://sourceforge.net/projects/qputty/'
depends=('glibc' 'gcc-libs' 'libgssglue' 'qt>=4.6.1' 'libx11')
makedepends=('tar' 'binutils')
_arch=i386
md5sums=('8831dd79024df76625569f3773c5300b'
	 'f634704eca4f41f15e4ff033798566b6'
	 '2379cddb9900d7b98da88a4bdaf5db06')
install=qputty.install

[[ "$CARCH" == "x86_64" ]] && {
  _arch=amd64
  md5sums[0]='2feb50ac47d3a550ce115d7cb30e0445'
}
source=("http://cdnetworks-us-2.dl.sourceforge.net/project/qputty/binary/snapshots/linux/${pkgname}_${pkgver}-snapshot_${_arch}.deb"
	'putty.png'
	'qputty.install')

build() {
  msg "Converting debian package..."
  cd "$srcdir"
  tar zxf data.tar.gz -C "$pkgdir"
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/32x32/apps
  install -m644 "$srcdir"/putty.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps
}
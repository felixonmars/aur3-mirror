# Contributor: XAVeRY <los.danielos@gmail.com>

pkgname=cbtt80
pkgver=20060727
pkgrel=1
pkgdesc="A C++ port of the original Python BitTorrent tracker"
arch=('i686' 'x86-64')
url="http://bnbtusermods.sourceforge.net"
license=('LGPL')
depends=(zlib dtach gcc-libs bash)
install=cbtt.install
source=(http://switch.dl.sourceforge.net/sourceforge/bnbtusermods/$pkgname-$pkgver-src.tar.bz2
	bnbt-h_cstring.patch
	cbtt.install
	cbtt.rc.d
	bnbt.cfg)

md5sums=('cd810a231fc518bfbee3347d74d18b00'
	 '988af23632aaad6159e634c7fe2ff3df'
	 'a55906ea3ad66169ee4357ce37fb2970'
	 '4fb2bcaa6763c9f81d6cfe38cc59a88d'
	 '62c839e467ae260d9398cf7ade2bdb90')

build() {
  cd "$srcdir/$pkgname-$pkgver-src"

# this is a tiny patch that fixes issues concerning the fact that 
# string.h wasn't included in bnbt.h, resulting in compilation errors
  patch -Np0 -i ../bnbt-h_cstring.patch || return 1

  make bnbt || return 1
  install -D -m755 bnbt $pkgdir/home/tracker/bnbt
  chmod 700 $pkgdir/home/tracker
  cd $startdir
  install -D -m755 cbtt.rc.d $pkgdir/etc/rc.d/cbtt
  install -m644 bnbt.cfg $pkgdir/home/tracker/bnbt.cfg
}

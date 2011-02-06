# Contributor: Vinay S Shastry <vinayshastry@gmail.com>

pkgname=xmms-itouch
pkgver=0.1.2
pkgrel=1
pkgdesc="xmms-itouch - iTouch keyboard control plugin for XMMS"
url="http://www.saunalahti.fi/~syrjala/xmms-itouch/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('xmms')
source=(http://www.saunalahti.fi/~syrjala/xmms-itouch/$pkgname-$pkgver.tar.gz)
md5sums=(1e3faf8e834071ebc2f6fcfc2b87049f)

build() {
  cd $startdir/src/$pkgname-$pkgver	  
  libdir=`xmms-config --general-plugin-dir`
  datadir=`xmms-config --data-dir`
  ./configure --prefix=/usr 
  make || return 1
  make libdir=$startdir/pkg/${libdir} datadir=$startdir/pkg/${datadir} install
}

# Contributor: Lukasz Fidosz <virhilo@gmail.com>
pkgname=libsbc-cvs
pkgver=20070428
pkgrel=1
pkgdesc="Bluetooth low-complexity, subband codec"
arch=(i686 x86_64)
url="http://www.holtmann.org/linux/bluetooth/sbc.html"
license=('LGPL')
makedepends=('cvs' 'automake' 'libtool' 'autoconf')

_cvsmod="sbc"
_cvsroot=":pserver:anonymous@sbc.cvs.sourceforge.net:/cvsroot/sbc"

build() {
	cd $startdir/src

  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
	cvs -d $_cvsroot co $_cvsmod
  msg "Starting make..."

  cd ./$_cvsmod

  ./bootstrap || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make prefix=$startdir/pkg/usr install || return 1
}

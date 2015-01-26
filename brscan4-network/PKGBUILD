# Contributor: Manuel Mendez <mmendez534@gmail.com>
# Contributor: Brenton <brenton@taylorbyte.com>
 
pkgname='brscan4-network'
pkgver='0.4.3'  
pkgrel='0'
license=('GPL')
url='http://support.brother.com/g/s/id/linux/en/download_scn.html#brscan4'

pkgdesc="SANE drivers from Brother for scanners on a network"
 
arch=('i686' 'x86_64')
depends=('sane' 'sed' 'libusb-compat')
provides=('brscan4')
conflicts=('brscan4')
 
install=brscan4-network.install
 
source=('brscan4-network.install')
md5sums=('686edd1fd502c87bd763acb41f08b536')
 
if [ "$CARCH" == "x86_64" ]; then
  source+=("http://download.brother.com/welcome/dlf006648/brscan4-$pkgver-$pkgrel.x86_64.rpm")
  md5sums+=('b15962f7694c1bd9cb7e2ec35c553480')
else
  source+=("http://download.brother.com/welcome/dlf006647/brscan4-$pkgver-$pkgrel.i386.rpm")
  md5sums+=('d12d79fa08aaac5fdf5fdc85a5d380d2')
fi
 
build() {
cd $srcdir
rpm=${source[1]}
bsdtar -xf ${rpm##*/}
}

package() {
mkdir -p $pkgdir/usr/bin
cp -R $srcdir/usr/bin/* $pkgdir/usr/bin/
cp -R $srcdir/opt/ $pkgdir/opt/
cp -R $srcdir/etc/ $pkgdir/etc/
if [ "$CARCH" == "x86_64" ]; then
mv $srcdir/usr/lib{64,}
fi
cp -R $srcdir/usr/lib/ $pkgdir/usr/
}
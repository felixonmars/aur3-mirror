# Maintainer: Robin Choudhury <rchoudhu@calpoly.edu>
pkgname=digilent-adept-runtime
pkgver=2.13.1
pkgrel=1
pkgdesc="Digilent Adept is a unique and powerful solution which allows you to communicate with Digilent system boards and a wide assortment of logic devices."
arch=('i686' 'x86_64')
url="http://www.digilentinc.com/Products/Detail.cfm?Prod=ADEPT2"
license=('unknown')
groups=('adept')
makedepends=(libusbx)
provides=('digilent-adept-runtime')
conflicts=('digilent-adept-runtime')
replaces=('digilent-adept-runtime')

name="digilent.adept.runtime_"

_source_arch="x86_64"
[ "$CARCH" = "i686" ] && _source_arch="i686"
source=("http://www.digilentinc.com/Data/Products/ADEPT2/digilent.adept.runtime_$pkgver-${_source_arch}.tar.gz")

md5sums=('091655dbe852e4eb6fe930668b483570') #generate with 'makepkg -g'

_runtimepath="$srcdir/$name$pkgver-${_source_arch}"

prepare() {
   cd "$srcdir/$_runtimepath"
   patch install.sh < ../../install.patch
}

package() {
   _datapath="$pkgdir/usr/local/share/digilent/data"
   _sbinpath="$pkgdir/sbin"
   _runtimepath="$srcdir/$name$pkgver-${_source_arch}"

   if [ "$CARCH" == "i686" ]; then
      _libpath="$pkgdir/lib/"
   else
      _libpath="$pkgdir/lib64/"
   fi

   cd "$_runtimepath"

   ./install.sh datapath="$_datapath" libpath="$_libpath" sbinpath="$_sbinpath" silent=1
   install -m 644 -D digilent-adept.conf "$pkgdir/etc/digilent-adept.conf" &&
   install -m 644 -D 52-digilent-usb.rules "$pkgdir/etc/udev/rules.d/52-digilent-usb.rules" &&
   install -m 644 -D digilent-adept-libraries.conf "$pkgdir/etc/ld.so.conf.d/digilent-adept-libraries.conf"
   sed -i 's:DigilentDataPath=/.*:DigilentDataPath=/usr/local/share/digilent/data:' $pkgdir/etc/digilent-adept.conf
}

post_install() {
   udevadm control --reload-rules
   /sbin/ldconfig
}

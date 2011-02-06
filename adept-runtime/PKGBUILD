# Maintainer: fishfish <chiizufish of the gmail variety>
pkgname=adept-runtime
pkgver=2.5.1
pkgrel=1
pkgdesc="core runtime necessary to communicate with Digilent system boards"
arch=('i686')
url="http://www.digilentinc.com/Products/Detail.cfm?NavPath=2,66,828&Prod=ADEPT2"
license=('custom')
depends=('libusb>=1.0' 'gcc-libs')
install=adept-runtime.install
source=('digilent.adept.runtime_2.5.1-i686.tar.gz::http://www.digilentinc.com/Cart/Download.cfm?DURL=/Data/Products/ADEPT2/digilent.adept.runtime_2.5.1-i686.tar.gz&ProductID=Adept2.5.1-L-86')
md5sums=('01c895731dba1ea5526fe0f1b756dd80')

package() {
  cd "$srcdir/digilent.adept.runtime_$pkgver-i686"

  # shared libraries
  mkdir -p "$pkgdir/usr/lib/digilent/adept"
  cp -d lib/* "$pkgdir/usr/lib/digilent/adept"
  chmod -R 755 "$pkgdir/usr/lib/digilent/adept"

  # firmware images
  mkdir -p "$pkgdir/usr/share/digilent/data/firmware"
  install -m 644 data/firmware/*.HEX "$pkgdir/usr/share/digilent/data/firmware"

  # JTSC device list
  install -m 644 data/jtscdvclist.txt "$pkgdir/usr/share/digilent/data"

  # CoolRunner support files
  mkdir "$pkgdir/usr/share/digilent/data/xpla3"
  install -m 644 data/xpla3/*.map "$pkgdir/usr/share/digilent/data/xpla3"

  # CoolRunner 2 support files
  mkdir "$pkgdir/usr/share/digilent/data/xbr"
  install -m 644 data/xbr/*.map "$pkgdir/usr/share/digilent/data/xbr"

  # Adept runtime configuration file
  mkdir "$pkgdir/etc"
  sed -i 's_usr/local/share_usr/share_' digilent-adept.conf
  install -m 644 digilent-adept.conf "$pkgdir/etc"

  # udev rules
  mkdir -p "$pkgdir/etc/udev/rules.d"
  install -m 644 52-digilent-usb.rules "$pkgdir/etc/udev/rules.d"

  # library configuration file
  mkdir "$pkgdir/etc/ld.so.conf.d"
  sed -i -e 's_local/lib_lib_' -e '/lib64/,$d' digilent-adept-libraries.conf
  install -m 644 digilent-adept-libraries.conf "$pkgdir/etc/ld.so.conf.d"

  # EULA
  mkdir -p "$pkgdir/usr/share/licenses/adept-runtime"
  install -m 644 EULA "$pkgdir/usr/share/licenses/adept-runtime"
}

# vim:set ts=2 sw=2 et:

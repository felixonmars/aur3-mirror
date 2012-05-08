# Maintainer: fishfish <chiizufish of the gmail variety>
pkgname=adept-runtime
pkgver=2.9.9
pkgrel=1
pkgdesc="core runtime necessary to communicate with Digilent system boards"
arch=('i686' 'x86_64')
url="http://www.digilentinc.com/Products/Detail.cfm?NavPath=2,66,828&Prod=ADEPT2"
license=('custom')
depends=('libusb>=1.0' 'libftd2xx')
install=adept-runtime.install

# hack to make sure a valid URL shows up
# on the AUR page - taken from the Dropbox PKGBUILD
_arch=i686
[[ $CARCH == x86_64 ]] && _arch=x86_64
source=("http://www.digilentinc.com/Data/Products/ADEPT2/digilent.adept.runtime_2.9.9-$_arch.tar.gz")

md5sums=('7f37291299844184f243d59b584ced71')
[[ $CARCH == x86_64 ]] && md5sums[0]='d05b7b2bb5c9c64b5c09bedc9a0e3c1a'

package() {
  cd "$srcdir/digilent.adept.runtime_$pkgver-$CARCH"

  # shared libraries
  mkdir -p "$pkgdir/usr/lib/digilent/adept"
  if [[ $CARCH == i686 ]]; then
    cp -d lib/* "$pkgdir/usr/lib/digilent/adept"
  elif [[ $CARCH == x86_64 ]]; then
    cp -d lib64/* "$pkgdir/usr/lib/digilent/adept"
  fi
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

  # module unloader binary
  # ("This application detaches any kernel drivers that are attached
  #   to the interfaces of the device, ensuring that the Runtime will
  #   be able to communicate with the device using libusb.")
  mkdir "$pkgdir/usr/sbin"
  if [[ $CARCH == i686 ]]; then
    install -m 755 bin/dftdrvdtch "$pkgdir/usr/sbin"
  elif [[ $CARCH == x86_64 ]]; then
    install -m 755 bin64/dftdrvdtch "$pkgdir/usr/sbin"
  fi

  # udev rules
  mkdir -p "$pkgdir/etc/udev/rules.d"
  # the udev script uses the legacy SYSFS attribute; replace it with
  # the newer ATTR syntax
  sed -i 's_usr/local/sbin_usr/sbin_; s_SYSFS_ATTR_g' 52-digilent-usb.rules
  install -m 644 52-digilent-usb.rules "$pkgdir/etc/udev/rules.d"

  # library configuration file
  mkdir "$pkgdir/etc/ld.so.conf.d"
  sed -i -e 's_local/lib_lib_' -e '/lib64/,$d' digilent-adept-libraries.conf
  if [[ $CARCH == x86_64 ]]; then
    sed -i 's_32-bit_64-bit_' digilent-adept-libraries.conf
  fi
  install -m 644 digilent-adept-libraries.conf "$pkgdir/etc/ld.so.conf.d"

  # EULA
  mkdir -p "$pkgdir/usr/share/licenses/adept-runtime"
  install -m 644 EULA "$pkgdir/usr/share/licenses/adept-runtime"
}

# vim:set ts=2 sw=2 et:

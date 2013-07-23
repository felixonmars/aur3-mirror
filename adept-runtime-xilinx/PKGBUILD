# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

pkgname=adept-runtime-xilinx
pkgver=2.13.1
pkgrel=2
pkgdesc="Core runtime necessary to communicate with Digilent logic devices"
arch=('i686' 'x86_64')
url="http://www.digilentinc.com/Products/Detail.cfm?Prod=ADEPT2"
license=('custom')
depends=('libusb>=1.0' 'libftd2xx=1.0.4' 'usbdrv')
provides=('adept-runtime')
options=(!strip)
install='adept-runtime.install'
source=("http://www.digilentinc.com/Data/Products/ADEPT2/digilent.adept.runtime_${pkgver}-$CARCH.tar.gz"
        "20-digilent-usb.rules")
sha256sums=('fc789fb1fbdfa156ef8cc6773f0804136c938b438240fdc87be528c1648bd0c1'
            '3096132317149ec4de5f9a753384f0e94e70dd14b2d232532298cb522bbe13b5')
[[ $CARCH == i686 ]] && sha256sums[0]='c6a51ae4cb1eafb36e1504f0abbf081961e4188851b34ddf792a54bc430ebe0d'

package() {
  cd "${srcdir}/digilent.adept.runtime_$pkgver-$CARCH"

  # Install shared libraries
  install -d "${pkgdir}/usr/lib/digilent/adept"
  if [[ $CARCH == i686 ]]; then
    cd "${srcdir}/digilent.adept.runtime_$pkgver-$CARCH/lib"
  elif [[ $CARCH == x86_64 ]]; then
    cd "${srcdir}/digilent.adept.runtime_$pkgver-$CARCH/lib64"
  fi

  for _lib in *.so.*.*.*; do
    _libBasename=$(basename "${_lib}")
    _temp=(${_libBasename//.so./ })
    _libName=${_temp[0]}

    _temp=(${_temp[1]//./ })

    _versionMajor=${_temp[0]}
    _versionMinor=${_temp[1]}
    _versionMaint=${_temp[2]}

    install -m 755 "${_libBasename}" "${pkgdir}/usr/lib/digilent/adept/"

    ln -rs "${pkgdir}/usr/lib/digilent/adept/${_libBasename}" \
           "${pkgdir}/usr/lib/digilent/adept/${_libName}.so"

    ln -rs "${pkgdir}/usr/lib/digilent/adept/${_libBasename}" \
           "${pkgdir}/usr/lib/digilent/adept/${_libName}.so.${_versionMajor}"
  done

  cd "${srcdir}/digilent.adept.runtime_$pkgver-$CARCH"

  # Firmware images
  install -d "${pkgdir}/usr/share/digilent/data/firmware"
  install -m 644 data/firmware/*.HEX "${pkgdir}/usr/share/digilent/data/firmware"

  # The Adept README suggest to install these with mode 755, but these never
  # get executed on our host system, so we install them with mode 644 (no
  # executable bit set)
  install -m 644 data/firmware/*.so "${pkgdir}/usr/share/digilent/data/firmware"

  # JTSC device list
  install -m 644 data/jtscdvclist.txt "${pkgdir}/usr/share/digilent/data"

  # CoolRunner support files
  install -d "${pkgdir}/usr/share/digilent/data/xpla3"
  install -m 644 data/xpla3/*.map "${pkgdir}/usr/share/digilent/data/xpla3"

  # CoolRunner 2 support files
  install -d "${pkgdir}/usr/share/digilent/data/xbr"
  install -m 644 data/xbr/*.map "${pkgdir}/usr/share/digilent/data/xbr"

  # Adept runtime configuration file
  install -d "${pkgdir}/etc"
  sed -i 's_usr/local/share_usr/share_' digilent-adept.conf
  install -m 644 digilent-adept.conf "${pkgdir}/etc"

  # library configuration file
  install -d "${pkgdir}/etc/ld.so.conf.d"
  sed -i -e 's_local/lib_lib_' -e '/lib64/,$d' digilent-adept-libraries.conf
  if [[ $CARCH == x86_64 ]]; then
    sed -i 's_32-bit_64-bit_' digilent-adept-libraries.conf
  fi
  install -m 644 digilent-adept-libraries.conf "${pkgdir}/etc/ld.so.conf.d"

  # Udev rules
  install -d "${pkgdir}/etc/udev/rules.d"
  install -m 644 "${srcdir}/20-digilent-usb.rules" "${pkgdir}/etc/udev/rules.d"

  # EULA
  install -d "${pkgdir}/usr/share/licenses/adept-runtime-xilinx"
  install -m 644 EULA "${pkgdir}/usr/share/licenses/adept-runtime-xilinx"
}

# vim: set ts=2 sw=2 ft=sh noet:

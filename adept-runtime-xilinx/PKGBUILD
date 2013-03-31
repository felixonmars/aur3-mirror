# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

# The sources for this PKGBUILD will most likely be NOT available for download
# from the vendor (Digilent). You must manually copy them from a Xilinx ISE
# installation, e.g.
#
#  $ cd </path/to/PKGBUILD>
#  $ tar -cvzf digilent.adept.runtime_2.10.4-x86_64.tar.gz \
#        -C /opt/Xilinx/14.4/ISE_DS/ISE/bin/lin64/digilent/ \
#        digilent.adept.runtime_2.10.4-x86_64
#
# Then, run "makepkg" to build the package.
# If you get error messages stating that one or more files did not pass the
# validity check, you need to generate new checksums using "makepkg -g", then
# copy the checksums to the sha256sums array.
#
# If you are on a 32-bit installation, replace the sha256sums[0]='...' line
# with the first line of the "makepkg -g" output.

pkgname=adept-runtime-xilinx
pkgver=2.10.4
pkgrel=1
pkgdesc="Core runtime necessary to communicate with Digilent logic devices"
arch=('i686' 'x86_64')
url="http://www.digilentinc.com/Products/Detail.cfm?Prod=ADEPT2"
license=('custom')
depends=('libusb>=1.0' 'libftd2xx-digilent=1.0.4' 'usbdrv')
options=(!strip)
install='adept-runtime.install'
source=("http://www.digilentinc.com/Data/Products/ADEPT2/digilent.adept.runtime_${pkgver}-$CARCH.tar.gz"
        "20-digilent-usb.rules")
sha256sums=('3488dcc24596025dc750972a0ea825fe27d52146b3a2346181dc6adda407524f'
            '3096132317149ec4de5f9a753384f0e94e70dd14b2d232532298cb522bbe13b5')
[[ $CARCH == i686 ]] && sha256sums[0]='3d245b89bede51b7cf6d4cf2026fb4f45b038b8737581878e72a969483739282'

package() {
  cd "${srcdir}/digilent.adept.runtime_$pkgver-$CARCH"

  # Install shared libraries
  install -d "${pkgdir}/usr/lib/digilent/adept"
  if [[ $CARCH == i686 ]]; then
    cd "${srcdir}/digilent.adept.runtime_$pkgver-$CARCH/lib"
  elif [[ $CARCH == x86_64 ]]; then
    cd "${srcdir}/digilent.adept.runtime_$pkgver-$CARCH/lib64"
  fi

  for _lib in *.so*; do
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

# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Artem A Klevtsov <unikum.pm [at the] gmail [dot] com>

pkgbase=('scangearmp-mp550')

pkgname=('scangearmp-mp550')
true && pkgname=('scangearmp-common' 'scangearmp-mp550')
_pkgname=scangearmp

pkgver=1.40
pkgrel=4
_pkgreview=1

pkgdesc="Canon Scanner Driver (For Multifunction MP550 series)"
url="http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MP_series/PIXMA_MP550.aspx"

arch=('i686' 'x86_64')
license=('custom')

conflicts=('lib32-cnijfilter320')
if [ "${CARCH}" = 'x86_64' ]; then
  makedepends=('gcc-multilib' 'libtool-multilib' 'lib32-libusb-compat')
elif [ "${CARCH}" = 'i686' ]; then
  makedepends=('gcc' 'libtool' 'gimp' 'libusb-compat')
fi
makedepends+=('autoconf>=2.59' 'automake>=1.10' 'tar' 'make' 'sane')


# File size: 2178560 bytes
source=("http://files.canon-europe.com/files/soft37281/Software/Linux_Scangear_Source_Files.tar"
        "mychanges.patch")
sha1sums=('b3c87196e5c8ca0d0201efa7296cbf276b3e758d'
          '6c84efb154f1cc6a46200e3bc42074c748049d32')

# File size: 12064812 bytes
if [ "${CARCH}" = 'x86_64' ]; then
  # there is no lib32-gimp package; so we we are forced to use .so files from the i686 binary!
  source+=("http://mirror.selfnet.de/archlinux/extra/os/i686/gimp-2.8.6-1-i686.pkg.tar.xz")
  sha1sums+=('e848cc45a1221452a227cb780d9fd1c9f6e3297e')
fi

build() {
  cd ${srcdir}
  tar xzf ${_pkgname}-source-${pkgver}-${_pkgreview}.tar.gz
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  export CC="gcc -m32"
  
  patch -p1 -i ../mychanges.patch

  for libname in "libgimp-2.0.so" "libgimpmath-2.0.so" "libgimpconfig-2.0.so" "libgimpcolor-2.0.so" "libgimpbase-2.0.so"; do
    if [ "${CARCH}" = 'x86_64' ]; then
      ln -s ${srcdir}/usr/lib/${libname} com/libs_bin/${libname}
    elif [ "${CARCH}" = 'i686' ]; then
      ln -s /usr/lib32/${libname} com/libs_bin/${libname}
    fi
  done

  cd scangearmp
  ./autogen.sh --prefix=/usr --libdir=/usr/lib32 || exit 1
  if [ -x /usr/bin/libtool ]; then
    rm libtool
    ln -s /usr/bin/libtool
  else
    exit 1;
  fi
  make || exit 1;
}

package_scangearmp-common() {
  pkgdesc="Canon Scanner Driver - Common files (32-bit)"
  install=scangearmp-common.install

  if [ "${CARCH}" = 'x86_64' ]; then
    depends=('sane' 'lib32-libusb-compat')
  elif [ "${CARCH}" = 'i686' ]; then
    depends=('sane' 'libusb-compat' 'gimp')
  fi

  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}/scangearmp
  
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32

  if [ "${CARCH}" = 'x86_64' ]; then
    for libname in "libgimp-2.0.so.0.800.6" "libgimpmath-2.0.so.0.800.6" "libgimpconfig-2.0.so.0.800.6" "libgimpcolor-2.0.so.0.800.6" "libgimpbase-2.0.so.0.800.6"; do
      install -s -m 755 ${srcdir}/usr/lib/${libname} ${pkgdir}/usr/lib32/${libname}
    done
  fi
  
  install -D -m 644 etc/80-canon_mfp.rules ${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules
  
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}
  install -m 666 com/ini/canon_mfp_net.ini ${pkgdir}/usr/lib32/bjlib
  
  for libname in "libcncpnet.so.1.1.0" "libcncpmsui.so.1.4.0" "libcncpcmcm.so.6.50.1" "libcncpmsimg.so.1.0.1" "libcncpmslld.so.1.0.0"; do
    install -s -m 755 com/libs_bin/${libname} ${pkgdir}/usr/lib32
  done
  chmod 644 ${pkgdir}/usr/lib32/libsane-canon_mfp.a

  install -D LICENSE-scangearmp-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-scangearmp-${pkgver}EN.txt
}

package_scangearmp-mp550() {
  pkgdesc="Canon Scanner Driver (For Multifunction MP550 series)"
  install=scangearmp-mp550.install

  if [ "${CARCH}" = 'x86_64' ]; then
    depends=('lib32-gtk2>=2.6' "${_pkgname}-common=${pkgver}")
  elif [ "${CARCH}" = 'i686' ]; then
    depends=('gtk2>=2.6' "${_pkgname}-common=${pkgver}")
  fi
  
  cd ${srcdir}/${_pkgname}-source-${pkgver}-${_pkgreview}

  install -d ${pkgdir}/usr/lib32/bjlib
  for libname in "libcncpmsimg359.so.1.4.0" "libcncpmslld359c.so.1.04.1" "libcncpmslld359.so.1.4.0"; do
    install -s -m 755 359/libs_bin/${libname} ${pkgdir}/usr/lib32
  done
  for auxname in "cnc173dd.tbl" "cnc_3590.tbl" "CNC550.DAT" "CNC550P.DAT"; do
    install -m 644 359/${auxname} ${pkgdir}/usr/lib32/bjlib
  done

  install -D LICENSE-scangearmp-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-scangearmp-${pkgver}EN.txt
}


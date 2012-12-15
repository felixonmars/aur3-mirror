# Maintainer: Andre Bartke <dev@bartke.cc>

_target=avr32-unknown-linux-gnu

pkgname=cross-avr32-gnu-toolchain
pkgver=3.4.1
pkgrel=1
pkgdesc="Atmel AVR32 Toolchain for Linux"
arch=('i686' 'x86_64')
url="http://www.atmel.com/"
license=('GPL')
options=('!strip')

if test "$CARCH" == x86_64; then
  depends=("lib32-glibc" "lib32-zlib")
  source=("http://www.atmel.com/Images/avr32-gnu-toolchain-3.4.1.348-linux.any.x86_64.tar.gz"
          "http://www.atmel.com/Images/avr-headers-3.2.3.970.zip")
else
  depends=('glibc' 'zlib')
  source=("http://www.atmel.com/Images/avr32-gnu-toolchain-3.4.1.348-linux.any.x86.tar.gz"
          "http://www.atmel.com/Images/avr-headers-3.2.3.970.zip")
fi

package() {
  mkdir -p $pkgdir/usr/lib/cross-${_target}
  mkdir -p $pkgdir/usr/bin

  msg "Copying files to cross compiler tree..."
  if test "$CARCH" == x86_64; then
    cp -r $srcdir/avr32-gnu-toolchain-linux_x86_64/* $pkgdir/usr/lib/cross-${_target}
  else
    cp -r $srcdir/avr32-gnu-toolchain-linux_x86/* $pkgdir/usr/lib/cross-${_target}
  fi
  cp -r $srcdir/avr32 $pkgdir/usr/lib/cross-${_target}/avr32/include

  msg "Cleaning-up cross compiler tree..."
  rm -rf ${pkgdir}/usr/lib/cross-${_target}/{info,man}
  rm -rf ${pkgdir}/usr/lib/cross-${_target}/share/{info,man}

  msg "Creating out-of-path executables..."
  mkdir -p ${pkgdir}/usr/lib/cross-${_target}/avr32/bin/
  rm -f ${pkgdir}/usr/lib/cross-${_target}/avr32/bin/*
  cd ${pkgdir}/usr/lib/cross-${_target}/avr32/bin/
  for bin in ${pkgdir}/usr/lib/cross-${_target}/bin/avr32-*; do
    bbin=`basename "$bin"`;
    ln -s "/usr/lib/cross-${_target}/bin/${bbin}" `echo "$bbin" | sed "s#^avr32-##"`;
  done

  msg "Creating /usr/bin symlinks..."
  for bin in ${pkgdir}/usr/lib/cross-${_target}/bin/avr32-*; do
    bbin=`basename "$bin"`;
    ln -s "/usr/lib/cross-${_target}/bin/${bbin}" "${pkgdir}/usr/bin/${bbin}";
  done
}

if test "$CARCH" == x86_64; then
  md5sums=('b297d2ba2f1351c80d6452bbefd8940d'
           '88a02e9e00f2d74235610d8fae80c380')
else
  md5sums=('b133d8a7a73170035869127890c7970b'
           '88a02e9e00f2d74235610d8fae80c380')
fi


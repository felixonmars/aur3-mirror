# Maintainer: Paul Mattal <paul@archlinux.org>
# Contributor: ALexandr Mekh <alexandr.mekh@gmail.com>

pkgname="lirc-grani"
pkgver=0.9.0
pkgrel=10
pkgdesc="Lirc with patch to support Redray Grani J-series IR-receivers."
arch=('i686' 'x86_64')
url="http://www.lirc.org/"
license=('GPL')
depends=('linux>=3.2' 'alsa-lib' 'libx11' 'libftdi' 'libirman')
makedepends=('help2man' 'linux-headers>=3.2' 'alsa-lib' 'libx11' 'libftdi' 'libirman' 'python2')
optdepends=('python2: pronto2lirc utility')
provides=('lirc-utils')
replaces=('lirc+pctv' 'lirc-utils')
backup=('etc/lirc/hardware.conf' 'etc/conf.d/lircd.conf' 'etc/conf.d/irexec.conf')
options=('!makeflags' '!strip' '!libtool')
install=lirc.install
_extramodules=extramodules-`uname -r |sed 's/^\(...\).*/\1/'`-ARCH
_kernver="$(cat /lib/modules/${_extramodules}/version)"

source=(http://prdownloads.sourceforge.net/lirc/lirc-${pkgver}.tar.bz2
	lirc_igorhid.patch
        lirc_wpc8769l.patch
        lircd-handle-large-config.patch
        lirc_atiusb-kfifo.patch
        kernel-2.6.39.patch
	lircd lircmd lirc.logrotate lircd.conf irexec.conf irexecd hardware.conf)
md5sums=('b232aef26f23fe33ea8305d276637086'
	 '5c0f67a4a3641db792cc0187d963ba84'
         '1cce37e18e3f6f46044abab29016d18f'
         'b70cc9640505205446ec47b7d4779f38'
         '1f8b104a2365d9f93404b143f499059b'
         '087a7d102e1c96bf1179f38db2b0b237'
         '8d0e238dc0eda95e340fe570605da492'
         '85f7fdac55e5256967241864049bf5e9'
         '3deb02604b37811d41816e9b4385fcc3'
         '5b1f8c9cd788a39a6283f93302ce5c6e'
         'f0c0ac930326168035f0c8e24357ae55'
         '69d099e6deedfa3c1ee2b6e82d9b8bfb'
         '7f7526e424e16295e722c6dad31deaa9')

build() {
  cd "${srcdir}/lirc-${pkgver}"
  patch -Np1 -i "${srcdir}/lirc_wpc8769l.patch"
  patch -Np1 -i "${srcdir}/lircd-handle-large-config.patch"
  patch -Np1 -i "${srcdir}/lirc_atiusb-kfifo.patch"
  patch -Np1 -i "${srcdir}/kernel-2.6.39.patch"
  patch -Np1 -i "${srcdir}/lirc_igorhid.patch"

  sed -i '/AC_PATH_XTRA/d' configure.ac
  sed -e 's/@X_CFLAGS@//g' \
      -e 's/@X_LIBS@//g' \
      -e 's/@X_PRE_LIBS@//g' \
      -e 's/@X_EXTRA_LIBS@//g' -i Makefile.am tools/Makefile.am
  libtoolize
  autoreconf

  PYTHON=python2 ./configure --enable-sandboxed --prefix=/usr \
      --with-driver=all --with-kerneldir=/usr/src/linux-${_kernver}/ \
      --with-moduledir=/lib/modules/${_kernver}/kernel/drivers/misc \
      --with-transmitter

 # Remove drivers already in kernel
  sed -e "s:lirc_dev::" -e "s:lirc_bt829::" \
      -e "s:lirc_imon::" -e "s:lirc_parallel::" -e "s:lirc_sasem::" \
      -e "s:lirc_serial::" -e "s:lirc_sir::" -e "s:lirc_ttusbir::" \
      -i Makefile drivers/Makefile drivers/*/Makefile tools/Makefile 
  make
}

package() {
  cd "${srcdir}/lirc-${pkgver}"
  make DESTDIR="${pkgdir}" install

  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;

  install -d "$pkgdir/usr/share/lirc" "$pkgdir/etc/rc.d"
  cp "${srcdir}"/{lircd,lircmd,irexecd} "${pkgdir}/etc/rc.d"
  cp -rp remotes "$pkgdir/usr/share/lirc"
  chmod -R go-w "$pkgdir/usr/share/lirc/"

  # install the logrotate config
  install -D -m644 "$srcdir/lirc.logrotate" "$pkgdir/etc/logrotate.d/lirc"
    
  # install conf.d file
  install -D -m644 "$srcdir/lircd.conf" "$pkgdir/etc/conf.d/lircd.conf"

  # install conf.d file
  install -D -m644 "$srcdir/irexec.conf" "$pkgdir/etc/conf.d/irexec.conf"
  
  install -d "$pkgdir/etc/lirc"
  
  #install hardware.conf file
  install -D -m644 "$srcdir/hardware.conf" "$pkgdir/etc/lirc/hardware.conf"
}

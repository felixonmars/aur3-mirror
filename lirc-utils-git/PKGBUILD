# Maintainer: Mark Foxwell <fastfret79@archlinux.org.uk>

pkgname=('lirc-utils-git')
pkgver=20110524
pkgrel=1
_kernver=2.6.39-ARCH
pkgdesc="Linux Infrared Remote Control utils"
depends=('alsa-lib' 'libx11' 'libftdi' 'libirman')
optdepends=('python2: pronto2lirc utility')
options=('strip' '!libtool')
arch=('i686' 'x86_64')
url="http://www.lirc.org/"
license=('GPL')
makedepends=('help2man' 'kernel26-headers' 'alsa-lib' 'libx11' 'libftdi' 'libirman' 'python2' 'git')
source=(irexec.conf lirc.logrotate lircd.conf lircd lircmd irexecd)
provides=lirc-utils
conflicts=lirc-utils
md5sums=('f0c0ac930326168035f0c8e24357ae55'
         '3deb02604b37811d41816e9b4385fcc3'
         '5b1f8c9cd788a39a6283f93302ce5c6e'
         '8d0e238dc0eda95e340fe570605da492'
         '85f7fdac55e5256967241864049bf5e9'
         '69d099e6deedfa3c1ee2b6e82d9b8bfb')

_gitroot="git://lirc.git.sourceforge.net/gitroot/lirc/lirc"
_gitname="lirc"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  sed -i '/AC_PATH_XTRA/d' configure.ac
  sed -e 's/@X_CFLAGS@//g' \
      -e 's/@X_LIBS@//g' \
      -e 's/@X_PRE_LIBS@//g' \
      -e 's/@X_EXTRA_LIBS@//g' -i Makefile.am tools/Makefile.am

  ./autogen.sh
  PYTHON=/usr/bin/python2  ./configure --enable-sandboxed --prefix=/usr \
          --with-driver=all --with-kerneldir=/usr/src/linux-${_kernver}/ \
          --with-moduledir=/lib/modules/${_kernver}/kernel/drivers/misc \
          --with-transmitter

  # Remove drivers already in kernel
  sed -e "s:lirc_dev::" -e "s:lirc_bt829::" -e "s:lirc_igorplugusb::" \
      -e "s:lirc_imon::" -e "s:lirc_parallel::" -e "s:lirc_sasem::" \
      -e "s:lirc_serial::" -e "s:lirc_sir::" -e "s:lirc_ttusbir::" \
      -e "s:lirc_atiusb::" -e "s:lirc_i2c::" -e "s:lirc_wpc8769l::" \
      -i Makefile drivers/Makefile drivers/*/Makefile tools/Makefile

  make
}

package() {

  cd "$srcdir/$_gitname-build"
  
  make DESTDIR="${pkgdir}" install
  
  install -d "${pkgdir}/usr/share/lirc" "${pkgdir}/etc/rc.d"
  cp "${srcdir}"/{lircd,lircmd,irexecd} "${pkgdir}/etc/rc.d"
  cp -rp remotes "${pkgdir}/usr/share/lirc"
  chmod -R go-w "${pkgdir}/usr/share/lirc/"

  # install the logrotate config
  install -Dm644 "${srcdir}/lirc.logrotate" "${pkgdir}/etc/logrotate.d/lirc"

  # install conf.d file
  install -Dm644 "${srcdir}/lircd.conf" "${pkgdir}/etc/conf.d/lircd.conf"

  # install conf.d file
  install -Dm644 "${srcdir}/irexec.conf" "${pkgdir}/etc/conf.d/irexec.conf"

  install -d "${pkgdir}/etc/lirc"

}

# vim:set ts=2 sw=2 et:

pkgname=udev-old-kernel
_pkgname=udev
pkgver=146
pkgrel=6
pkgdesc="The userspace dev tools (udev) for kernel older than 2.6.27"
arch=(i686 x86_64)
url="http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev.html"
license=('GPL')
groups=('base')
depends=('glibc' 'coreutils' 'util-linux' 'libusb' 'glib2')
makedepends=('kernel26' 'gperf' 'libxslt') #kernel26 needed to build framebuffer blacklist 
install=udev.install
backup=(etc/udev/udev.conf
        etc/modprobe.d/framebuffer_blacklist.conf)
conflicts=('pcmcia-cs' 'hotplug' 'initscripts<2009.07' 'udev')
provides=('udev=151-3')
replaces=('devfsd')
# older initscripts versions required start_udev
options=(!makeflags !libtool)
source=(http://www.kernel.org/pub/linux/utils/kernel/hotplug/$_pkgname-$pkgver.tar.bz2
        81-arch.rules load-modules.sh resolve-modalias.c cdsymlinks.sh root-link.sh
        arch-udev-rules.patch ignore-remove.sh cups-hplip-fix.patch)
md5sums=('b2a8acefda4fa8a70d45642035abd718'
         'cc6406e8b67b2b8711942098a66cde6b'
         'f4951f61438d69894b728212dac7318b'
         '64a0169dc9d883a63ff9f8f491fdc34a'
         '2e808ee78d237c478b57af2a68d43769'
         '2d6dc6842464f107bccc68cd505a6c31'
         '9be4683c480488926fdf92a34ae5963c'
         '35fa97500243a79b2370fa4684828e69'
         '8cd53a3d91d2321a646033dc18f29217')

build() {
  cd $srcdir/$_pkgname-$pkgver
  # fix raw printers, will be fixed in udev-147
  patch -Np1 -i ../cups-hplip-fix.patch
  ./configure --prefix="" --mandir=/usr/share/man \
                          --includedir=/usr/include \
                          --libexecdir=/lib/udev \
                          --datarootdir=/usr/share
  make
  make DESTDIR=$pkgdir install
  # Fix pkgconfig path
  install -d -m755 $pkgdir/usr/lib
  mv $pkgdir/lib/pkgconfig $pkgdir/usr/lib
  install -D -m644 $srcdir/81-arch.rules $pkgdir/lib/udev/rules.d/81-arch.rules
  # Fix ConsoleKit path
  mv $pkgdir/lib/ConsoleKit $pkgdir/usr/lib
  # Install our rule for permissions and symlinks
  # install our module loading subsystem
  install -D -m755 $srcdir/load-modules.sh $pkgdir/lib/udev/load-modules.sh
  install -d -m755 $pkgdir/bin
  gcc -Wall $CFLAGS -o $pkgdir/bin/resolve-modalias $srcdir/resolve-modalias.c
  # install cdsymlinks.sh
  install -D -m755 $srcdir/cdsymlinks.sh $pkgdir/lib/udev/cdsymlinks.sh
  # install root-link.sh
  install -D -m755 $srcdir/root-link.sh $pkgdir/lib/udev/root-link.sh
  # install ignore-remove.sh
  install -D -m755 $srcdir/ignore-remove.sh $pkgdir/lib/udev/ignore-remove.sh
  # disable error logging to prevent startup failures printed to vc on boot
  sed -i -e 's|udev_log="err"|udev_log="0"|g' $pkgdir/etc/udev/udev.conf
  # install additional standard rules files
  for rule in $srcdir/$_pkgname-$pkgver/rules/packages/*.rules; do
      install -D -m 644 $rule $pkgdir/lib/udev/rules.d/
  done
  # fix standard udev rules to fit to arch
  cd $pkgdir/lib/udev/rules.d/
  patch -Np1 -i $srcdir/arch-udev-rules.patch
  # remove .orig files
  rm -f $pkgdir/lib/udev/rules.d/*.orig
  # disable persistent cdromsymlinks and network by default 
  # and move it to /etc/udev/rules.d
  mv $pkgdir/lib/udev/rules.d/75-persistent-net-generator.rules \
     $pkgdir/etc/udev/rules.d/75-persistent-net-generator.rules.optional
  mv $pkgdir/lib/udev/rules.d/75-cd-aliases-generator.rules \
     $pkgdir/etc/udev/rules.d/75-cd-aliases-generator.rules.optional
  # remove not needed rules
  rm $pkgdir/lib/udev/rules.d/40-ia64.rules
  rm $pkgdir/lib/udev/rules.d/40-ppc.rules
  rm $pkgdir/lib/udev/rules.d/40-s390.rules
  rm $pkgdir/lib/udev/rules.d/64-device-mapper.rules
  rm $pkgdir/lib/udev/rules.d/64-md-raid.rules

  # create framebuffer blacklist
  mkdir -p $pkgdir/etc/modprobe.d/
  for mod in $(find /lib/modules/*/kernel/drivers/video -name '*fb.ko' -exec basename {} .ko \;); do 
	echo "blacklist $mod" >> $pkgdir/etc/modprobe.d/framebuffer_blacklist.conf
  done

  # create static devices in /lib/udev/devices/
  mkdir ${pkgdir}/lib/udev/devices
  mkdir ${pkgdir}/lib/udev/devices/pts
  mkdir ${pkgdir}/lib/udev/devices/shm

  mknod -m 0600 ${pkgdir}/lib/udev/devices/console c 5 1
  mknod -m 0666 ${pkgdir}/lib/udev/devices/null c 1 3
  mknod -m 0660 ${pkgdir}/lib/udev/devices/zero c 1 5
  mknod -m 0666 ${pkgdir}/lib/udev/devices/kmsg c 1 11

  ln -snf /proc/self/fd ${pkgdir}/lib/udev/devices/fd
  ln -snf /proc/self/fd/0 ${pkgdir}/lib/udev/devices/stdin
  ln -snf /proc/self/fd/1 ${pkgdir}/lib/udev/devices/stdout
  ln -snf /proc/self/fd/2 ${pkgdir}/lib/udev/devices/stderr
  ln -snf /proc/kcore ${pkgdir}/lib/udev/devices/core

  # these static devices are created for convenience, to autoload the modules if necessary
  # /dev/loop0
  mknod -m 0660 ${pkgdir}/lib/udev/devices/loop0 b 7 0
  chgrp disk ${pkgdir}/lib/udev/devices/loop0
  # /dev/net/tun
  mkdir ${pkgdir}/lib/udev/devices/net
  mknod -m 0666 ${pkgdir}/lib/udev/devices/net/tun c 10 200
  # /dev/fuse
  mknod -m 0666 ${pkgdir}/lib/udev/devices/fuse c 10 229
  # /dev/ppp
  mknod -m 0600 ${pkgdir}/lib/udev/devices/ppp c 108 0

  # Replace dialout group in rules with uucp group
  for i in $pkgdir/lib/udev/rules.d/*.rules; do
    sed -i -e 's#GROUP="dialout"#GROUP="uucp"#g' $i
  done

  cp $pkgdir/lib/udev/firmware.sh $pkgdir/lib/udev/firmware
}

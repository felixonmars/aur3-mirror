pkgname=upstart-initscripts
pkgver=2010.02
pkgrel=1
pkgdesc="System initialization/bootup scripts for upstart"
arch=('i686' 'x86_64')
url="http://github.com/bmravec/archupstartinits"
license=('GPL')
conflicts=('initscripts')
replaces=('initscripts')
backup=(etc/rc.conf etc/rc.local etc/rc.local.shutdown)
depends=('glibc' 'bash' 'awk' 'grep' 'coreutils' 'sed' 'udev>=139-1'
         'net-tools' 'ncurses' 'kbd' 'findutils' 'upstart')
optdepends=('bridge-utils: Network bridging support'
            'dhcpcd: DHCP network configuration'
            'wireless_tools: Wireless networking')
source=(ftp://ftp.archlinux.org/other/initscripts/initscripts-2009.08-1.tar.gz
        http://cloud.github.com/downloads/bmravec/archupstartinits/upstartinit-$pkgver-1.tar.gz)
md5sums=('b22b03d1df6baee93a31d4279b96eedd'
         '6646268448fd72f6d07890be8e69e381')

build () {
  cd ${srcdir}/initscripts-2009.08-1/
  gcc $CFLAGS -o minilogd minilogd.c || exit 1
}

package () {
  cd ${srcdir}/initscripts-2009.08-1/

  # Install files from initscripts
  install -d -m755 ${pkgdir}/etc/rc.d || exit 1
  install -d -m755 ${pkgdir}/etc/conf.d || exit 1
  install -d -m755 ${pkgdir}/etc/rc.d/functions.d/ || exit 1
  install -d -m755 ${pkgdir}/etc/cron.hourly/ || exit 1

  for i in inittab rc.conf; do
    install -D -m644 $i ${pkgdir}/etc/$i || exit 1
  done

  for i in rc.local rc.local.shutdown rc.shutdown; do
    install -D -m755 $i ${pkgdir}/etc/$i || exit 1
  done

  install -D -m755 adjtime.cron ${pkgdir}/etc/cron.hourly/adjtime

  install -D -m644 functions ${pkgdir}/etc/rc.d/functions || exit 1
  for i in network netfs; do
    install -D -m755 $i ${pkgdir}/etc/rc.d/$i || exit 1
  done

  install -D -m755 minilogd ${pkgdir}/sbin/minilogd || exit 1

  cd ${srcdir}/upstartinit-${pkgver}-${pkgrel}/

  # install files for upstart
  install -d -m755 ${pkgdir}/etc/init || exit 1
  for i in cleanleftover consolefont ctrlaltdel fsck hostname hwclock locale loopback \
           modules mount nisdomain pudevrules rc-multi rc-shutdown rc rs rseed setrunlevel \
           sysclock tty1 tty2 udev udevsettle raid lvm encvol; do
    install -D -m644 ${i}.conf ${pkgdir}/etc/init/${i}.conf || exit 1
  done
  install -D -m644 functions ${pkgdir}/etc/init/functions || exit 1
}

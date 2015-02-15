# Contributor: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=epoch-init-system
_pkgname=epoch
pkgver=1.2.2
pkgrel=1
pkgdesc="Epoch Init System"
arch=('i686' 'x86_64')
license=('custom: unlicense')
compatible="no" # To make it compatible with your current init,
		# you could edit the above variable to "yes".
		# The conflicts line below could then be commented out.
		# To boot with epoch you would need to add:
		# init=/usr/bin/epoch to your bootloader configuration.
conflicts=('systemd-sysvcompat' 'sysvinit')
url="http://universe2.us/epoch.html"
depends=('')
optdepends=('eudev: dyanamic device management'
	    'eudev-systemdcompat: for eudev'
	    'dbus: message system bus'
	    'syslog-ng: logger'
	    'cronie: cron'
	    'openssh: ssh'
	    'consolekit: tracking users, login sessions, and seats'
	    'polkit-consolekit: policykit'
	    'dhcpcd: dhcp client'
            'wicd: network management'
            'networkmanager-consolekit: network management'
	    'cups: printing'
	    'ntp: network time protocol'
	    'gpm: mouse server'
	    'alsa-utils: sound'
	    'lxdm-consolekit: displaymanager'
	    'upower-nosystemd: pm-utils')
source=("https://github.com/Subsentient/$_pkgname/archive/$pkgver.tar.gz"
	'scripts.tar.gz'
	'epoch.conf'
	'bootgreet')
backup=('etc/epoch/epoch.conf'
	'etc/bootgreet'
	'etc/epoch/scripts/udev.sh'
	'etc/epoch/scripts/mountruntmp.sh'
	'etc/epoch/scripts/network_start.sh'
	'etc/epoch/scripts/network_stop.sh'
	'etc/epoch/scripts/gensshkeys.sh')
install="$pkgname.install"
md5sums=('d75eb5d333a3e2af7112528d1e5408e2'
         'c1d655a763ee479e1303b4ed80bca758'
         'a870068bbb236f989181b89547432a3a'
         'c4c85ba3a97ce1f3bc62729d113fc09b')

build () {
	cd $_pkgname-$pkgver
	./buildepoch.sh
}

package () {
    cd "$srcdir/$_pkgname-$pkgver"
    # binaries and symlinks
  if [ "$compatible" == "yes" ]; then
    install -Dm755 "built/sbin/epoch" "${pkgdir}/usr/bin/epoch"
  else
    install -Dm755 "built/sbin/epoch" "${pkgdir}/usr/bin/epoch"
    install -Dm777 "built/sbin/halt" "${pkgdir}/usr/bin/halt"
    install -Dm777 "built/sbin/init" "${pkgdir}/usr/bin/init"
    install -Dm777 "built/sbin/killall5" "${pkgdir}/usr/bin/killall5"
    install -Dm777 "built/sbin/poweroff" "${pkgdir}/usr/bin/poweroff"
    install -Dm777 "built/sbin/reboot" "${pkgdir}/usr/bin/reboot"
    install -Dm777 "built/sbin/shutdown" "${pkgdir}/usr/bin/shutdown"
  fi
    # config files
    install -Dm644 "${srcdir}/epoch.conf" "${pkgdir}/etc/epoch/epoch.conf"
    install -Dm644 "${srcdir}/bootgreet" "${pkgdir}/etc/bootgreet"
    # sample scripts
    install -Dm755 "${srcdir}/scripts/mountruntmp.sh" "${pkgdir}/etc/epoch/scripts/mountruntmp.sh"
    install -Dm755 "${srcdir}/scripts/udev.sh" "${pkgdir}/etc/epoch/scripts/udev.sh"
    install -Dm755 "${srcdir}/scripts/network_start.sh" "${pkgdir}/etc/epoch/scripts/network_start.sh"
    install -Dm755 "${srcdir}/scripts/network_stop.sh" "${pkgdir}/etc/epoch/scripts/network_stop.sh"
    install -Dm755 "${srcdir}/scripts/gensshkeys.sh" "${pkgdir}/etc/epoch/scripts/gensshkeys.sh"
    # docs and license
    install -Dm644 "README" "${pkgdir}/usr/doc/$pkgname-$pkgver/README"
    install -Dm644 "UNLICENSE.TXT" "${pkgdir}/usr/doc/$pkgname-$pkgver/UNLICENSE.TXT"
    install -Dm644 "CHANGELOG" "${pkgdir}/usr/doc/$pkgname-$pkgver/CHANGELOG"
}

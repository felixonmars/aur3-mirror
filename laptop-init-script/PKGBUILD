# Contributor: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

# TODO:
# - sdparm + hdparm support

pkgname=laptop-init-script
pkgver=1.1
pkgrel=1
pkgdesc="Small rc.d script for enabling/disabling cpufrequtils, pm-utils, laptop-mode-tools and hdparm optimalizations from init (rc.conf)"
arch=('any')
license=('GPL')
url="http://wiki.archlinux.org/index.php/Laptop-init-script"
depends=('cpufrequtils' 'pm-utils' 'laptop-mode-tools' 'hdparm' 'sdparm')

build() {
  mkdir -p ${pkgdir}/etc/rc.d

cat > ${pkgdir}/etc/rc.d/laptop-init <<"EOF"
#!/bin/bash
#universal daemon controller
# general config
. /etc/rc.conf
. /etc/rc.d/functions

cpufreq-set-all() {
  	cpus=$(sed -ne 's/^processor.* \([0-9]\+\)$/\1/p' /proc/cpuinfo)
		for cpu in $cpus
		do
			cpufreq-set -c $cpu -g $1
		done
}

case "$1" in
  start)
	stat_busy "Enabling cpufreq CPU scaling"
		#cpufreq-set-all conservative	#less dynamic (saving more power, but slooooow)
		cpufreq-set-all ondemand		#more dynamic (saving power, when speed is not needed)
		stat_done
	stat_busy "Entering laptop mode"
		echo 1 > /proc/sys/vm/laptop_mode
		stat_done
	stat_busy "Launching pm-powersave true"
		pm-powersave true
		stat_done
    ;;
  stop)
	stat_busy "Disabling cpufreq CPU scaling"
		cpufreq-set-all performance
		stat_done
	stat_busy "Leaving laptop mode"
		echo 0 > /proc/sys/vm/laptop_mode
		stat_done
	stat_busy "Launching pm-powersave false"
		pm-powersave false
		stat_done
    ;;
  restart)
	$0 stop
	sleep 1
	$0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac

EOF

	chmod -R 755 ${pkgdir}/
}

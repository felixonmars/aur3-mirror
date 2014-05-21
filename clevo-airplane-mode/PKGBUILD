# Maintainer: Koutheir Attouchi <koutheir at gmail dot com>

pkgname=clevo-airplane-mode
pkgver=1.0
pkgrel=1
pkgdesc='Clevo Airplane Mode button and LED handling.'
license=('BSD')
arch=('any')
url=('http://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26&s=82130b57e71bd5b6ea569abc1424025c6f8d412d')
depends=('bash' 'rfkill' 'tuxedo-wmi-dkms' 'xorg-xmodmap')
source=('clevo-airplane-mode-led-control' '60-clevo-airplane-mode.rules' '60-clevo-airplane-mode-button-xmodmap')
md5sums=('4d7341d6e8e90af51b6d576f9299e9f4' '5e088bc18a93def257e3c3005aced161' '4a762f39a7373fb97e136af4ed57bb3b')

package() {
	install -Dm755 clevo-airplane-mode-led-control ${pkgdir}/usr/bin/clevo-airplane-mode-led-control
	install -Dm755 60-clevo-airplane-mode.rules ${pkgdir}/etc/udev/rules.d/60-clevo-airplaine-mode.rules
	install -Dm755 60-clevo-airplane-mode-button-xmodmap ${pkgdir}/etc/X11/xinit/xinitrc.d/60-clevo-airplane-mode-button-xmodmap
}

post_install() {
	echo "Updating udev rules... "
	udevadm control --reload
	
	echo "Updating xmodmap keys..."
	/etc/X11/xinit/xinitrc.d/60-clevo-airplane-mode-button-xmodmap
}

post_upgrade() {
	post_install
}

post_remove() {
	echo "Updating udev rules... "
	udevadm control --reload
	
	echo "Updating xmodmap keys..."
	xmodmap -e "keycode 247 = "
}

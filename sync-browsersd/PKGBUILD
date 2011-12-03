# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='sync-browsersd'
_name=$(echo $pkgname | sed 's/d//')
pkgver=1.1
pkgrel=1
pkgdesc="Daemon symlinks and syncs firefox and/or chromium profile directories to RAM thus reducing HDD/SDD calls and speeding-up browsers."
arch=(any)
url=https://aur.archlinux.org/packages.php?ID=54511
license=('GPL')
depends=('rsync' 'cron')
conflicts=('firefox-sync' 'firefox-tmpfs-daemon' 'chromium-tmpfs' 'tmpfs-store')
source=("sync-browsers"
"$pkgname.conf"
"rc.$pkgname")
install=readme.install
backup=("etc/$pkgname.conf")

package() {
	install -D -m 644 "${srcdir}"/$pkgname.conf "${pkgdir}"/etc/$pkgname.conf
	install -D -m 755 "${srcdir}"/rc.$pkgname "${pkgdir}"/etc/rc.d/"$pkgname"
	install -D -m 755 "${srcdir}"/$_name "${pkgdir}"/usr/bin/$_name
}
sha256sums=('92a11fe86fdf5a187cbbfa2cea74323f3a491450f8d1a44ad61f1ffaa0d458ee'
            '896f7f2697057ba263eb10ccca009996bf7391c5bab2f01524380e9d50f15252'
            '8e88679c9040792468d8656f201a017ab04c7e7718ee69f4a2b7be7ca5387fb0')

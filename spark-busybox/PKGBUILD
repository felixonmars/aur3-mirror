# Maintainer: base64 -d <<< YWxhZEBhcmNobGludXguaW5mbwo=
# Contributor: Jack Frost <fbt@fleshless.org>

pkgbase='spark-busybox'
pkgname=('spark-busybox-git' 'busybox-sysvcompat')
_pkgname='spark-rc'
license=('ISC')
pkgver=1.7.1
pkgrel=2
arch=('any')
url='https://git.fleshless.org/spark-rc'
makedepends=('git')
source=("git+https://git.fleshless.org/spark-rc"
	"busybox.patch"
	"inittab")
sha256sums=('SKIP'
            '2efdf95a6742d508e0a7968153cbd858c4ae31181b5e6af46575cfaa885cd7b9'
            '8fffed3a3d6265026b907d4e3febe9d7d11a44f2acc2c3527cba9a6d1e003b0d')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -p1 rc.in < "$srcdir/busybox.patch"
}

build() {
  cd "$_pkgname"
  make
}

package_spark-busybox-git() {
  pkgdesc='A simple rc script for busybox'
  depends=('busybox' 'bash')
  optdepends=('watchman-sm: service manager'
	      'watchman-sm-services-git: example service files'
	      'busybox-sysvcompat: sysvinit compat for busybox'
	      'acpid: power management'
	      'pm-utils: power management'
	      'archlinux-cronjobs: cron functionality'
	      'cronie: cron functionality'
	      'xorg-xwrapper: root privileges for Xorg'
	      'systemd: udev provider')
  conflicts=('sysvinit-tools-adds' 'minirc' 'spark-rc')
  backup=('etc/rc.conf' 'etc/rc.motd' 'etc/inittab')
  install=spark-busybox.install  

  cd "$_pkgname"
  make USR=/usr DESTDIR="$pkgdir" install
  install -m644 "$srcdir/inittab" "$pkgdir/etc"
}

package_busybox-sysvcompat() {
  pkgdesc='sysvinit compat for busybox'
  conflicts=('systemd-sysvcompat' 'minirc')
  
  mkdir -p "$pkgdir/usr/bin"
  for i in init halt poweroff reboot; do
    ln -sf /usr/bin/busybox "$pkgdir/usr/bin/$i"
  done
}

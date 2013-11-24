# Maintainer: Thomas Sowell <tom@fancydriving.org>

buildarch=1

pkgname=chromeos-recovery-daisy-spring
pkgdesc="Chrome OS recovery image"
pkgver=R30.4537
pkgrel=1
arch=('armv7h')
url="http://www.google.com/"
license=('custom:chromeosterms')
depends=()
provides=('chromeos-recovery')

_recoveryimage="chromeos_4537.108.0_daisy-spring_recovery_stable-channel_mp-v2.bin"

source=("https://dl.google.com/dl/edgedl/chromeos/recovery/${_recoveryimage}.zip")

md5sums=('7a642eef77f1e0aca2713ae7a965852c')

package() {
  cd "$srcdir"
  install -d ${pkgdir}/usr/share/chromeos-recovery
  install -m 644 ${srcdir}/${_recoveryimage} ${pkgdir}/usr/share/chromeos-recovery/chromeos-recovery.bin
}

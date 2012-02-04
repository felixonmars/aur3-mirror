# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

pkgname=cpufreq-systemd
pkgver=0.1
pkgrel=1
pkgdesc="systemd unit file for CPU frequency scaling"
arch=(any)
url="https://wiki.archlinux.org/index.php/Cpufreq"
license=('GPL')
depends=(systemd cpufrequtils)
install=cpufreq-systemd.install
source=(cpufreq.service
        cpufreq-systemd.sh)
sha256sums=('7365b72231e953206d43b9346386fa00fb1c73adcfaad160f46156a5bc0b1a3d'
            '9be9b4bfa1211ee47c0d5ef934bd70585ba524757ff7635557019a4196193a14')

package() {
  cd "$srcdir"
  install -m 644 -D "${srcdir}/cpufreq.service" "${pkgdir}/lib/systemd/system/cpufreq.service"
  install -m 755 -D "${srcdir}/cpufreq-systemd.sh" "${pkgdir}/usr/bin/cpufreq-systemd.sh"
}

# vim:set ts=2 sw=2 et:

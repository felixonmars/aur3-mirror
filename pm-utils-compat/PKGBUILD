# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=pm-utils-compat
pkgver=1
pkgrel=1
pkgdesc="Compatibility wrappers for pm-utils"
arch=("any")
license=("MIT")
url="https://aur.archlinux.org/packages/$pkgname"
conflicts=("pm-utils")
provides=("pm-utils")
source=("pm-action.sh"
        "pm-is-supported.sh"
        "pm-is-supported.pl")
sha1sums=(SKIP SKIP SKIP)

package() {
  install -dm0755 "$pkgdir/usr/lib/pm-utils/bin"
  install -dm0755 "$pkgdir/usr/bin"

  install -Dm0755 pm-action.sh            "$pkgdir/usr/lib/pm-utils/bin/pm-action"
  install -Dm0755 pm-is-supported.pl      "$pkgdir/usr/bin/pm-is-supported"

  for bin in pm-pmu pm-reset-swap; do
    ln -s /usr/bin/false                  "$pkgdir/usr/lib/pm-utils/bin/$bin"
  done
  for bin in pm-hibernate pm-suspend pm-suspend-hybrid; do
    ln -s /usr/lib/pm-utils/bin/pm-action "$pkgdir/usr/bin/$bin"
  done
  ln -s /usr/lib/systemd/systemd-ac-power "$pkgdir/usr/bin/on_ac_power"
  ln -s /usr/bin/true                     "$pkgdir/usr/bin/pm-powersave"
}

# vim: ts=2:sw=2:et:ft=sh

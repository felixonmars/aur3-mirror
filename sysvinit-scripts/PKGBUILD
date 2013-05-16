# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=sysvinit-scripts
pkgver=20130516
pkgrel=1
pkgdesc="RC scripts for sysvinit systems"
arch=('any')
url="https://www.archlinux.org/"
license=('GPL')
depends=('sysvinit')
makedepends=('mercurial')
source=('hg+https://bitbucket.org/stativ/sysvinit-scripts')
md5sums=('SKIP')
backup=()

pkgver() {
  date +%Y%m%d
}

package() {
  # install rc scripts
  cd "$srcdir/sysvinit-scripts/scripts"
  for _RCSCRIPT in *.rc ; do
    install -Dm 755 $_RCSCRIPT "$pkgdir/etc/rc.d/${_RCSCRIPT%.*}"
  done

  # install conf files
  cd "$srcdir/sysvinit-scripts/conf"
  for _CONF in *.conf ; do
    install -Dm 644 $_CONF "$pkgdir/etc/conf.d/${_CONF%.*}"
    # add the conf file to the backup array
    backup+=("etc/conf.d/${_CONF%.conf}")
  done

  # quagga needs a special handling
  for d in zebra ripd ripngd bgpd ospfd ospf6d isisd babeld; do
    install -D -m 755 "$srcdir/sysvinit-scripts/scripts/quagga.rc" "$pkgdir/etc/rc.d/$d"
    install -D -m 644 "$srcdir/sysvinit-scripts/conf/quagga.conf" "$pkgdir/etc/conf.d/$d"
    backup+=("etc/conf.d/$d")
  done
}

# vim:set ts=2 sw=2 et:

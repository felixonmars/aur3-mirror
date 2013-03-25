# This PKGBUILD replaces sysV init scheme
# with the runit supervision system.  see
# smarden.org/runit for more information.

# Contributor: Kevin Berry <kb@rubyists.com>
# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname='runit-run'
pkgver=1.1.3
pkgrel=1
pkgdesc="A SysV replacement init scheme with parallel start-up and flexible service directories"
arch=('i686' 'x86_64')
url="http://github.com/rubyists/runit-run"
license=('custom')
provides=('runit-run')
conflicts=('runit-run-git' 'initscripts')
depends=('runit' 'runit-services>=1.1.0' 'ngetty' 'sysvinit' 'sysvinit-tools')
optdepends=('socklog-dietlibc: advanced logging system' 
            'syslog-ng: flexible syslog system'
            'sv-helper: Wrapper for easy service management')
backup=('etc/rc.conf' 'etc/runit/1' 'etc/runit/2' 'etc/runit/3')
install='runit-run.install'
source=("https://s3.amazonaws.com/rubyists/aur/${pkgname}/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
md5sums=('a382fb7eecf95c50ec3007c449636bb7')

package() {
  cd "$srcdir/$pkgname"

  # Support functions for rc. scripts. Cloned from arch initscripts, Feb 2013
  install -D -d "$pkgdir/etc/runit/rc/functions.d"
  install -m 0755 etc/runit/rc/functions "$pkgdir/etc/runit/rc/functions"
  for fun in etc/runit/rc/functions.d/*;do
    install -m 0755 etc/runit/rc/functions.d/${fun##*/}  "$pkgdir/etc/runit/rc/functions.d/${fun##*/}"
  done

  # The rc. scripts. Cloned from arch initscripts, Feb 2013
  for script in sysinit single multi shutdown local local.shutdown; do
    install -m 0755 etc/runit/rc/rc.${script} "$pkgdir/etc/runit/rc/rc.${script}"
  done

  # For legagy rc.conf stuff
  install -m 0644 etc/runit/rc/rc.conf "$pkgdir/etc/runit/rc/rc.conf"
  install -m 0755 -d -D "$pkgdir/etc/rc.d"
  ln -s /etc/runit/rc/functions "$pkgdir/etc/rc.d"

  # The 3 init levels. Startup (1), runtime (2), and shutdown (3), plus
  # the script for action to taks on ctrl-alt-del
  for init in 1 2 3 ctrlaltdel;do
    install -m 0755 etc/runit/${init} "$pkgdir/etc/runit/${init}"
  done

  install -D -m 0644 README.runit-run "$pkgdir/usr/share/doc/runit-run/README"
  install -D -m 0644 COPYRIGHT "$pkgdir/usr/share/doc/runit-run/COPYRIGHT"

  # Add a couple service levels
  install -d "$pkgdir/etc/runit/runsvdir/runit-run-default" # sshd, no syslog
  install -d "$pkgdir/etc/runit/runsvdir/archlinux-default" # Standard, with syslog and sshd
  ln -s /etc/sv/ngetty "$pkgdir/etc/runit/runsvdir/runit-run-default/"
  ln -s /etc/sv/cron "$pkgdir/etc/runit/runsvdir/runit-run-default/"
  ln -s /etc/sv/sshd "$pkgdir/etc/runit/runsvdir/runit-run-default/"

  ln -s /etc/sv/ngetty "$pkgdir/etc/runit/runsvdir/archlinux-default/"
  ln -s /etc/sv/syslog-ng "$pkgdir/etc/runit/runsvdir/archlinux-default/"
  ln -s /etc/sv/sshd "$pkgdir/etc/runit/runsvdir/archlinux-default/"
  ln -s /etc/sv/cron "$pkgdir/etc/runit/runsvdir/archlinux-default/"

  # Link rc.conf and rc/ for legacy rc.d/ script compatibility
  ln -s /etc/runit/rc "$pkgdir/etc/rc"
  ln -s /etc/runit/rc/rc.conf "$pkgdir/etc/rc.conf"
} 

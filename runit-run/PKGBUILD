# This PKGBUILD replaces sysV init scheme
# with the runit supervision system.  see
# smarden.org/runit for more information.


# Contributor: Kevin Berry <kb@rubyists.com>
# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname='runit-run'
pkgver=1.0.0
pkgrel=5
pkgdesc="A SysV replacement init scheme with parallel start-up and flexible service directories"
arch=('i686' 'x86_64')
url="http://github.com/rubyists/runit-run"
license=('custom')
provides=('runit-run')
conflicts=('runit-run-git')
depends=('runit-dietlibc' 'fgetty')
optdepends=('socklog-dietlibc: advanced logging system' 
            'sv-helper: Wrapper for management of services'
            'runit-services: a collection of commonly used service directories')
backup=('etc/runit/1' 'etc/runit/2' 'etc/runit/3')
install='runit-run.install'
source=('https://github.com/downloads/rubyists/runit-run/runit-run-1.0.0-5.tar.gz')
md5sums=('4251ca5f0c6a1a1b80c9aed2253b0db0')

package() {
  cd "$srcdir/runit-run/"
  install -D -m 0755 etc/runit/1 $pkgdir/etc/runit/1
  install -m 0755 etc/runit/2 $pkgdir/etc/runit/2
  install -m 0755 etc/runit/3 $pkgdir/etc/runit/3
  install -m 0755 etc/runit/ctrlaltdel $pkgdir/etc/runit/ctrlaltdel
  install -d $pkgdir/etc/runit/runsvdir/runit-run-default
  install -d $pkgdir/etc/runit/runsvdir/archlinux-default
  install -D -m 0644 README.runit-run $pkgdir/usr/share/doc/runit-run/README
  install -D -m 0644 COPYRIGHT $pkgdir/usr/share/doc/runit-run/COPYRIGHT
  install -d $pkgdir/etc/sv
  for service in etc/sv/*;do
    cp -a $service $pkgdir/etc/sv/
  done
  ln -s /etc/sv/fgetty-tty2 $pkgdir/etc/runit/runsvdir/runit-run-default
  ln -s /etc/sv/fgetty-tty3 $pkgdir/etc/runit/runsvdir/runit-run-default
  ln -s /etc/sv/fgetty-tty2 $pkgdir/etc/runit/runsvdir/archlinux-default
  ln -s /etc/sv/fgetty-tty3 $pkgdir/etc/runit/runsvdir/archlinux-default
  for s in 1 4 5 6;do
    ln -s /etc/sv/agetty-tty${s} $pkgdir/etc/runit/runsvdir/archlinux-default
  done
    
  ln -s /etc/sv/syslog-ng $pkgdir/etc/runit/runsvdir/archlinux-default/
  ln -s /etc/sv/cron $pkgdir/etc/runit/runsvdir/archlinux-default/
} 

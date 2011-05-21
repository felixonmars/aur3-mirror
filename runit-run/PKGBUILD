# This PKGBUILD replaces sysV init scheme
# with the runit supervision system.  see
# smarden.org/runit for more information.


# Contributor: Kevin Berry <kb@rubyists.com>
# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname='runit-run'
pkgver=1.0.0
pkgrel=2
pkgdesc="A SysV replacement init scheme with parallel start-up and flexible service directories"
arch=('i686' 'x86_64')
url="http://github.com/rubyists/runit-run"
license=('custom')
provides=('runit-run')
conflicts=('runit-run-git')
depends=('runit-dietlibc')
optdepends=('socklog-dietlibc: advanced logging system' 'runit-services: a collection of commonly used service directories')
backup=('etc/runit/1' 'etc/runit/2' 'etc/runit/3')
install='runit-run.install'
source=('https://download.github.com/rubyists-runit-run-v1.0.0-0-g81f4e28.tar.gz')
md5sums=('bcddf2dd754e77515f2431e3bb705059')

package() {
  cd "$srcdir/rubyists-runit-run-5628518/"
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
  ln -s /etc/sv/agetty-tty2 $pkgdir/etc/runit/runsvdir/runit-run-default
  ln -s /etc/sv/agetty-tty3 $pkgdir/etc/runit/runsvdir/runit-run-default
  for s in $(seq 1 6);do
    ln -s /etc/sv/agetty-tty${s} $pkgdir/etc/runit/runsvdir/archlinux-default
  done
    
  ln -s /etc/sv/syslog-ng $pkgdir/etc/runit/runsvdir/archlinux-default/
  ln -s /etc/sv/cron $pkgdir/etc/runit/runsvdir/archlinux-default/
} 

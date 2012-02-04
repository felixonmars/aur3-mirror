# This PKGBUILD replaces sysV init scheme
# with the runit supervision system.  see
# smarden.org/runit for more information.


# Maintainer: Kevin Berry <deathsyn@gmail.com>
pkgname='runit-run-git'
pkgver=20120201
pkgrel=1
pkgdesc="A SysV replacement init scheme with parallel start-up and flexible service directories"
arch=('i686' 'x86_64')
url="http://github.com/rubyists/runit-run"
license=('custom')
provides=('runit-run')
depends=('runit-dietlibc' 'ngetty')
makedepends=('git')
optdepends=('socklog-dietlibc: advanced logging system' 
            'sv-helper: Wrapper for easy service management'
            'runit-services: a collection of commonly used service directories')
backup=('etc/runit/1' 'etc/runit/2' 'etc/runit/3')
install='runit-run.install'
source=('COPYRIGHT')
md5sums=('00378d23a0f0d8bb6dbc60d9f0578b7c')

_gitroot="git://github.com/rubyists/runit-run.git"
_gitname="runit-run"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/$_gitname/"
  install -D -m 0755 etc/runit/1 $pkgdir/etc/runit/1
  install -m 0755 etc/runit/2 $pkgdir/etc/runit/2
  install -m 0755 etc/runit/3 $pkgdir/etc/runit/3
  install -m 0755 etc/runit/ctrlaltdel $pkgdir/etc/runit/ctrlaltdel
  install -d $pkgdir/etc/runit/runsvdir/runit-run-default
  install -d $pkgdir/etc/runit/runsvdir/archlinux-default
  install -D -m 0644 README.runit-run $pkgdir/usr/share/doc/runit-run/README
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

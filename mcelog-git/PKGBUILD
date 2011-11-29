# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Dmitry Nosachev <quartz64@gmail.com>

pkgname=mcelog-git
pkgver=20111129
pkgrel=1
pkgdesc="Print machine check event log from x86-64 kernel"
url="http://mcelog.org/"
license=("GPL2")
arch=('i686' 'x86_64')
makedepends=('git')
provides=('mcelog')
options=('docs')
source=("mcelog.rc")
_gitroot="https://github.com/andikleen/mcelog"
_gitname=mcelog-git
md5sums=('f039a77d7bde3518d3d695b144816e8a')

build() {
    cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p $pkgdir/usr/share/doc/mcelog
  make install prefix=$pkgdir/usr etcprefix=$pkgdir DOCDIR=$pkgdir/usr/share/doc/mcelog
  install -Dm0755 mcelog.cron "${pkgdir}/usr/sbin/mcelog.cron"
  install -Dm0755 "${srcdir}/mcelog.rc" "${pkgdir}/etc/rc.d/mcelog"
  install -Dm0644 mcelog.logrotate "${pkgdir}/etc/logrotate.d/mcelog.logrotate"
  install -Dm0644 README "${pkgdir}/usr/share/doc/mcelog/README"
}

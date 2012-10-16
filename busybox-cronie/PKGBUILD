# Maintainer: nBVCXz <nbvcxz at o2 dot pl>
# Contributor: Daniel Beecham <daniel@lunix.se>

pkgname=busybox-cronie
pkgver=1.4.8
pkgrel=3
pkgdesc="Daemon that runs specified programs at scheduled times and related tools replaced with busybox"
url="http://busybox.net/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('busybox')
provides=('cronie'=$pkgver)
conflicts=('cronie')
options=('!strip')
source=("ftp://ftp.archlinux.org/core/os/$CARCH/cronie-$pkgver-$pkgrel-$CARCH.pkg.tar.xz")

build() {

  msg "creating package directories"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  mkdir "$pkgdir/usr/sbin"

  msg "creating symlinks for /usr/sbin"
  cd $pkgdir/usr/sbin
  ln -s /bin/busybox crond
  cd $pkgdir/usr/bin
  ln -s /bin/busybox crontab

  msg "copying missing xz libraries"
  cp -p $src/usr/sbin/anacron $pkgdir/usr/sbin/anacron
  cp -pR $srcdir/etc $pkgdir/etc
  cp -pR $srcdir/usr/lib $pkgdir/usr/lib
  cp -pR $srcdir/var $pkgdir/var

  msg "setting services"
  cd $pkgdir/usr/lib/systemd/system
  sed -i 's/-n/-f/' cronie.service # replace -n with busybox -f
  sed -i '/^ExecStart/ s/$/ -c \/var\/spool\/cron/' cronie.service # append proper path
}

if test $CARCH == "x86_64"; then
    sha256sums=('79d4a7f2bc702eac5376152a8f3071c834a451f09459ba49a9e7f176a3203ea8')
else
    sha256sums=('fa48878bb07a6ef2e2e00fc3edf0944cee306c80e1e77c950ee49bb9b2455ce7')
fi
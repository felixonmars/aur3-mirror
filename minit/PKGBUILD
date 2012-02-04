# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Mathias Baumann <marenz@supradigital.org>
pkgname=minit
pkgver=0.10
pkgrel=1
pkgdesc="A small yet feature-complete init"
arch=('i686' 'x86_64')
url="http://www.fefe.de/minit/"
license=('GPL')
groups=()
depends=()
makedepends=('dietlibc' 'libowfat')
optdepends=()
provides=()
conflicts=('sysvinit')
replaces=('sysvinit')
backup=()
options=()
install=
source=(http://dl.fefe.de/$pkgname-$pkgver.tar.bz2)
noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  make DESTDIR="$pkgdir/" install

  mkdir $pkgdir/etc/minit/{sysinit,default,network,single,syslog-ng}
  ln -s /etc/rc.sysinit $pkgdir/etc/minit/sysinit/run
  ln -s /etc/rc.single $pkgdir/etc/minit/single/run
  ln -s /etc/rc.d/network $pkgdir/etc/minit/network/run
  ln -s /etc/rc.d/syslog-ng $pkgdir/etc/minit/syslog-ng/run

  echo "sysinit\nnetwork" > $pkgdir/etc/minit/default/depends

  echo "start" > $pkgdir/etc/minit/network/params
  echo "syslog-ng" > $pkgdir/etc/minit/network/depends
  
  echo "start" > $pkgdir/etc/minit/syslog-ng/params

  touch $pkgdir/etc/minit/sysinit/sync




}

# vim:set ts=2 sw=2 et:
md5sums=('4b76cee0df8da0f7f901bf21e1ec484d')

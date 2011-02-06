# $Id: PKGBUILD,v 1.6 2008/08/03 06:48:27 Snowman Exp $
# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributor: Michael Barker

pkgname=emifreq-applet
pkgver=0.18
pkgrel=1
pkgdesc="An applet + daemon that shows/control the CPU frequency and temperature thanks to the cpufreq sysfs kernel interface."
arch=('i686' 'x86_64')
url="http://zzrough.free.fr/emifreq.php"
license=('GPL')
depends=('gnome-panel' )
makedepends=('intltool' 'gnome-doc-utils>=0.11.2' )
source=("http://zzrough.free.fr/emifreq/emifreq-applet-$pkgver.tar.gz"
        emifreqd)
md5sums=('399d271aaa397c1c6b45acfffb44a643'
         'fa49cc29cfdb86415681a21017dacf52')
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/emifreq-applet \
    --localstatedir=/var 
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -d $startdir/pkg/etc/rc.d
  install -D -m 644 $startdir/emifreqd $startdir/pkg/etc/rc.d
}

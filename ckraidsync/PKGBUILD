pkgname=ckraidsync
pkgver=0.1.0
pkgrel=2
pkgdesc="A script to perform a daily Linux MD/Software RAID synchronisation check"
url="http://lkml.org/lkml/2005/12/4/118"
license="GPL"
arch=('i686' 'x86_64')
depends=('at')
install=install.ckraidsync
source=(ckraidsync install.ckraidsync)
md5sums=('ec8d0ff6c7ab6c9e4b5b815481300602' 'beb66d4731ef5b73963736f6abda1fe6')

build() {

	install -D -m755 ckraidsync $startdir/pkg/etc/cron.daily/ckraidsync

}

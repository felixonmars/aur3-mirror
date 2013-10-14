# Maintainer: Takada Tomokazu <wacky.mk0 at gmail.com>

pkgname=unrealircd-aur
_pkgname=unrealircd
pkgver=3.2.10.1
pkgrel=1
pkgdesc="Open Source IRC Server"
arch=('i686' 'x86_64')
url="http://unrealircd.com"
license=('GPL2')
depends=('curl' 'c-ares')
conflicts=('ircd' 'unrealircd')
provides=('ircd')
install=unrealircd.install
backup=('etc/unrealircd/unrealircd.conf'
        'etc/conf.d/unrealircd')
source=(http://www.unrealircd.com/downloads/Unreal$pkgver.tar.gz
        unrealircd.service
        arch-fixes.patch)
md5sums=('97b4bd68a804e517355efa756f401a90'
         '7f6117c43ccb4d0acf7f1bdab13391ce'
         '82a268c93eab31eb14a64771d0b79932')

build() {
  cd $srcdir/Unreal$pkgver

  patch -p1 <$srcdir/arch-fixes.patch

  ac_cv_ip6=yes ./configure --with-showlistmodes \
      --enable-hub --enable-prefixaq --with-listen=5 \
      --with-dpath=/etc/unrealircd \
      --with-spath=/usr/bin/ircd \
      --with-nick-history=2000 --with-sendq=3000000 \
      --with-bufferpool=18 --with-hostname=archlinux \
      --with-permissions=0600 --with-fd-setsize=1024 \
      --enable-dynamic-linking \
      --enable-ziplinks \
      --enable-ssl \
      --enable-inet6 \
      --enable-libcurl=/usr \
      --with-system-cares

  make

  make pem
}

package() {
  cd $srcdir/Unreal$pkgver

  mkdir -p $pkgdir/etc/unrealircd
  mkdir -p $pkgdir/usr/bin

  make IRCDDIR=$pkgdir/etc/unrealircd BINDIR=$pkgdir/usr/bin install

  cp $srcdir/Unreal$pkgver/src/ircd $pkgdir/usr/bin/unrealircd
  cp $srcdir/Unreal$pkgver/doc/example.conf $pkgdir/etc/unrealircd/unrealircd.conf
  mkdir -p $pkgdir/usr/lib/unrealircd
  mv $pkgdir/etc/unrealircd/modules $pkgdir/usr/lib/unrealircd/
  ln -s /usr/lib/unrealircd/modules $pkgdir/etc/unrealircd/modules

  # log
  mkdir -p $pkgdir/var/log/unrealircd/
  touch $pkgdir/var/log/unrealircd/ircd.log
  ln -s /var/log/unrealircd/ircd.log $pkgdir/etc/unrealircd/ircd.log

  mkdir -p $pkgdir/etc/conf.d/
  echo 'UNREALIRCD_USER=root' >$pkgdir/etc/conf.d/unrealircd

  find $pkgdir/usr -type f -exec chmod ugo+r {} \;
  find $pkgdir/usr -type d -exec chmod ugo+rx {} \;

  install -Dm0644 $srcdir/$_pkgname.service $pkgdir/usr/lib/systemd/system/$_pkgname.service
}

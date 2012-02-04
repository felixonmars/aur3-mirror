# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=pppoj
pkgver=20110119
pkgrel=1
pkgdesc="PPP over Jabber"
arch=(i686 x86_64)
url="http://code.google.com/p/pppoj/"
license=('GPL')
depends=('gloox')
backup=(etc/conf.d/pppoj.conf)
source=("http://pppoj.googlecode.com/files/pppoj-$pkgver.tar.gz"
	pppoj.conf.d
	pppoj.rc)
md5sums=('a2a5c29ed5786a59272da3617ec7c07f'
         '65275df5107e2ebb14e9ca86ed1b4b21'
         '7c65ba645bcdcc9969eca0f4e760941f')

build() {
  cd "$srcdir/pppoj.hg"

  make PREFIX=/usr
  make install PREFIX=/usr DESTDIR=$pkgdir

  install -D -m0600 $srcdir/pppoj.conf.d $pkgdir/etc/conf.d/pppoj.conf
  install -D -m0755 $srcdir/pppoj.rc $pkgdir/etc/rc.d/pppoj
}

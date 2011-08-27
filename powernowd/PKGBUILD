# Contributor: kastor <kastor@fobos.org.ar>

pkgname=powernowd
pkgver=1.00
pkgrel=1
pkgdesc="Program for powering down CPUs dynamicly"
arch=(i686 x86_64)
url="http://www.deater.net/john/powernowd.html"
license="GPL"
depends=('glibc')
source=(http://www.deater.net/john/$pkgname-$pkgver.tar.gz \
        powernowd.rc.d powernowd.conf.d)

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  install -D -m755 powernowd $startdir/pkg/usr/sbin/powernowd
  install -D -m755 $startdir/src/powernowd.rc.d $startdir/pkg/etc/rc.d/powernowd
  install -D -m644 $startdir/src/powernowd.conf.d $startdir/pkg/etc/conf.d/powernowd
}
md5sums=('abc48b690d104e9e71a85400ba19d799' 'e9ce60d70107accfcf0665900c4ec3aa'\
         'f5a7c17320d9f8995b9916ddb60dbb71')

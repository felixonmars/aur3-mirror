# Maintainer: Valentin Hăloiu <vially.ichb+aur@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>  
# Contributor: Kevin Zuber <uKev@knet.eu>
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>

pkgname=uwsgi
pkgver=1.9.13
pkgrel=1
pkgdesc="A fast, self-healing and developer/sysadmin-friendly application container server coded in pure C"
arch=(i686 x86_64)
url="http://projects.unbit.it/$pkgname"
license=(GPL2)
depends=(python2 libxml2 jansson libyaml)
conflicts=(python-$pkgname)
makedepends=(gcc python2)
backup=(etc/uwsgi/emperor.ini)
source=(http://projects.unbit.it/downloads/$pkgname-$pkgver.tar.gz
        emperor.ini
        emperor.uwsgi.service)
md5sums=('e331f96469166520a0e3d02296199cbd'
         '495afaafac6da631a859ab72c5983c36'
         'a9788b2f174a7ab38c58c702be4513e8')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 uwsgiconfig.py --build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin
  install -Dm755 uwsgi $pkgdir/usr/bin/uwsgi
  mkdir -p $pkgdir/etc/uwsgi/apps
  install -Dm644 $srcdir/emperor.ini $pkgdir/etc/uwsgi/emperor.ini
  install -Dm644 $srcdir/emperor.uwsgi.service $pkgdir/usr/lib/systemd/system/emperor.uwsgi.service
}

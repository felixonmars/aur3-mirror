# Maintainer: Wu Xiaotian <yetist@gmail.com>

pkgname=gnhostlinux
pkgver=1.3.2
pkgrel=1
pkgdesc="DDNS Client for gnhost"
arch=('i686')
license=('custom')
url="http://www.gnway.com"
groups=('network')
backup=('/etc/gnhostlinux.conf')
source=(http://www1.gnway.com/download/${pkgname}${pkgver}.tgz
	gnhostlinux
)

md5sums=('0b42d7cc99e28f5dbb372fc251a8f2aa'
         'c0d62b4703d394fb9f826789fd360283')

build() {
  cd ${srcdir}
  install -D -m755 ../gnhostlinux.conf $startdir/pkg/etc/gnhostlinux.conf
  install -D -m755 gnhostlinux $startdir/pkg/usr/sbin/gnhostlinux
  install -D -m755 ../gnhostlinux $startdir/pkg/etc/rc.d/gnhostlinux
}

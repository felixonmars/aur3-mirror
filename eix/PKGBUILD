# Maintainer: Wu Xiaotian <yetist@gmail.com>

pkgname=eix
pkgver=0.20.1
pkgrel=1
pkgdesc="Small utility for searching ebuilds with indexing for fast results(from Gentoo)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://eix.sourceforge.net"
install=eix.install
groups=('base-devel')
depends=('sqlite3' 'xz')
options=('!emptydirs')
#backup=('/etc/make.conf')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.xz
	emerge-sync
	make.conf
)
md5sums=('f8128967a3b6bfb5f76b12767621334d'
'e7d31baa27d75ab369fe26acef999c59'
'c767822f61a93a828d7a7db4ea04a3ed')

build() {
  tar xf ${SRCDEST}/${pkgname}-${pkgver}.tar.xz -C ${srcdir}
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --with-bzip2 --enable-sqlite
  make || return 1
  make DESTDIR=${pkgdir} install
  install -D -m755 ../emerge-sync $startdir/pkg/usr/sbin/emerge-sync
  install -D -m755 ../make.conf $startdir/pkg/etc/
}

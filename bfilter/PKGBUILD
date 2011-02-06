# Contributor: system <system at tou.de>
# Contributor: wain <wain@archlinux.fr>
pkgname=bfilter
pkgver=1.1.4
pkgrel=2
pkgdesc="a realtime web filtering proxy"
url="http://bfilter.sourceforge.net/"
depends=('ace' 'gtkmm')
makedepends=('boost')
arch=('i686' 'x86_64')
license=('GPL')
backup=('etc/bfilter/config' 'etc/bfilter/urls.local')
install=bfilter.install
source=(http://downloads.sourceforge.net/bfilter/bfilter-1.1.4.tar.gz bfilterd)
md5sums=('787043ddf393f3e4f1205251861f5000'
         '856af5a41187225ebca8a9123cd46439')

build() {
  cd $startdir/src/$pkgname-$pkgver
  LIBS='/usr/lib/libboost_regex-mt.a /usr/lib/libboost_program_options-mt.a' ./configure --with-gui --without-builtin-boost --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m755 $startdir/src/bfilterd $startdir/pkg/etc/rc.d/bfilter
}

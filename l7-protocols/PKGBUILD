# Contributor: Vladimir Kutyavin <vlkut@bk.ru>
pkgname=l7-protocols
pkgver=20090528
pkgrel=1
pkgdesc="These are patterns (protocol definitions) for the L7-filter. To use them, you need the kernel26-l7 and iptables-l7."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://l7-filter.sourceforge.net/"
depends=('iptables>=1.4.3', 'glibc')
source=(http://downloads.sourceforge.net/project/l7-filter/Protocol%20definitions/2009-05-28/${pkgname}-2009-05-28.tar.gz)
md5sums=('91be154d12134dcdbc560cc7aa7fe4ce')
build() {
  cd $srcdir/$pkgname-2009-05-28
    make PREFIX=$pkgdir install || return 1 
}

# Maintainer: Tau Young <swulling@gmail.com>
pkgname=libqq2010
pkgver=0.68
pkgrel=1
pkgdesc="Latest QQ 2010 protocol for pidgin"
arch=('i686' 'x86_64')
url="http://code.google.com/p/libqq-pidgin"
license=('GPLv3')
depends=('libpurple')
conflicts=('libqq-svn')
makedepends=('p7zip')
source=(http://libqq-pidgin.googlecode.com/files/libqq.so.7z)
md5sums=('59d93a2513ae2c445ea030ea7fc48029')
package()
{
	cd ${srcdir}
	install -d ${pkgdir}/usr/lib/purple-2/ 
    7z x libqq.so.7z
    mv libqq.so libqq2010.so
	install -Dm755 libqq2010.so ${pkgdir}/usr/lib/purple-2/
}

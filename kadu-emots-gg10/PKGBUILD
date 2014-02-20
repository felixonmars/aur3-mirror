pkgname=kadu-emots-gg10
pkgver=1.0
pkgrel=2
pkgdesc="Emoticons pack for Kadu - GG10 style"
arch=('any')
url="http://www.kadu.net/w/Pobierz:dodatki"
license=('GPL')
optdepends=('kadu')
source=('http://janfla.sourceforge.net/repo/suse/noarch/kadu-emots-gg10.tar.gz')
md5sums=('6e9fdb2ffef7a8f3ea28dbc37f150572') 

package()
{
	cd "$srcdir"
	tar zxfv kadu-emots-gg10.tar.gz 
	install -d ${pkgdir}/usr
	mv ${srcdir}/usr/share ${pkgdir}/usr
}

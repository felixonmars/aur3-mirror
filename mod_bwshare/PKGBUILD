#Contributor: Sven Kauber <celeon@gmail.com>

pkgname=mod_bwshare
pkgver=0.2.1
pkgrel=5
pkgdesc="An Apache module that throttles HTTP requests for each client IP address independently"
arch=('i686')
url="http://www.topology.org/src/bwshare/README.html"
depends=('apache' 'glibc')
install=($pkgname.install)
source=('ftp://ftp.uni-duisburg.de/Infosys/servers/Apache/modules/mod_bwshare-0.2.1.zip' 'mod_bwshare.install')
# official mirror introduced a humanity test, reverting to a public source
# source=(http://www.topology.org/src/bwshare/$pkgname-$pkgver.zip)
license=('custom')
md5sums=('9f82d3a9649ac9cfbbba0255a210d1d3' '9eb02ff2fbc794416dc50fceaec7d777')

build(){
cd $srcdir/$pkgname-$pkgver

# building the module
apxs -c -o mod_bwshare.so mod_bwshare.c

install -D -m755 .libs/mod_bwshare.so $pkgdir/usr/lib/httpd/modules/mod_bwshare.so
install -D -m644 LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
}

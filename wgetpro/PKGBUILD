# Contributor: $pooky Hunter <spookyh@hotmail.com>
pkgname=wgetpro
pkgver=0.1.3
pkgrel=5
pkgdesc="Free software package for downloading files, based on GNU Wget"
url="http://wgetpro.sourceforge.net/"
license="GPL"
depends=('glibc' 'openssl')
#source=(http://mesh.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tgz)
source=(http://sourceforge.net/projects/wgetpro/files/wgetpro/0.1.3/wgetpro-0.1.3.tgz)
md5sums=('d92fdae1bd52be0d322282830cb67e49')
arch=('i686' 'x86_64')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
}

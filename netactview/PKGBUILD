# Contributor: lp76 <l.peduto@gmail.com>
pkgname=netactview
pkgver=0.6.1
pkgrel=1
pkgdesc="A graphical network connections viewer for Linux \
         similar in functionality with Netstat"
arch=('i686' 'x86_64')
url="http://netactview.sourceforge.net/index.html"
license=('GPL')
depends=('libgnome' 'libglade' 'gksu')
makedepends=('intltool')
source=(http://downloads.sourceforge.net/netactview/$pkgname-$pkgver.tar.bz2)
md5sums=('a6d14aaa2c0be9433cd61c1a410aca17')

build() 
{
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

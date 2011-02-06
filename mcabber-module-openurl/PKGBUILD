pkgname=(mcabber-module-openurl)
pkgver=0.0.1
pkgrel=1
pkgdesc="A small mcabber module allowing to open urls from current chat with /open command"
url="http://juick.com/336583"
source=('openurl.c' 'openlink')
depends=mcabber-hg
arch=('i686' 'x86_64')
install=('openurl.install' )
license=GPL

md5sums=('5470bca85dab469ae12e615bd1985010'
	 '1097343e3a8ea36c2441d7b6d4711205')


build() {
cd $srcdir
mkdir libopenurl

MODULE=openurl

libtool --mode=compile gcc `pkg-config --cflags glib-2.0 \
  gmodule-2.0 loudmouth-1.0` -I/usr/include/mcabber -c $MODULE.c
echo 1
libtool --mode=link gcc -module -rpath /usr/lib/mcabber/ \
  `pkg-config --cflags glib-2.0 gmodule-2.0 loudmouth-1.0` \
  -o lib$MODULE.la $MODULE.lo
echo 2
libtool --mode=install install lib$MODULE.la \
  `pwd`/lib$MODULE/lib$MODULE.la

mkdir -p $pkgdir/usr/lib/mcabber
install -D $srcdir/lib$MODULE/* $pkgdir/usr/lib/mcabber

mkdir -p $pkgdir/usr/share/mcabber/example
install -D $srcdir/openlink $pkgdir/usr/share/mcabber/example



}

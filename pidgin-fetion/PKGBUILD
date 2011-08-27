# Maintainer: Weng Xuetian <hurricanek@126.com>

pkgname=pidgin-fetion
_pidginver=`pidgin --version | awk '{print $2}'`
_gitver=09cd42145888da92cdf3bbfc78cd55abd1f59b69
pkgver=0.98
pkgrel=6
pkgdesc="China Mobile Fetion Protocol Plugin for pidgin"
arch=('i686' 'x86_64')
url="http://github.com/gradetwo/fetion"
license=('GPL')
makedepends=('avahi' 'tk' 'ca-certificates' 'intltool')
depends=('pidgin>=2.6.0')
options=('!libtool')
source=(http://github.com/gradetwo/fetion/tarball/$_gitver
http://downloads.sourceforge.net/pidgin/pidgin-$_pidginver.tar.bz2
autogen.sh.tar.gz protocol-makefile.patch config.patch
986.patch)

build() {
# cd $srcdir/gradetwo-fetion-$_gitver
cd $srcdir/gradetwo-fetion-09cd421
patch -p0 -i $srcdir/986.patch
cd "$srcdir/pidgin-$_pidginver"
rm -rf libpurple/protocols/fetion
# mv ../gradetwo-fetion-$_gitver libpurple/protocols/fetion
mv ../gradetwo-fetion-09cd421 libpurple/protocols/fetion
mv ../autogen.sh .
patch -p1 < ../config.patch
patch -p1 < ../protocol-makefile.patch

./autogen.sh --prefix=/usr --sysconfdir=/etc --disable-schemas-install --disable-meanwhile \
--disable-nm --disable-perl --disable-gnutls --enable-cyrus-sasl --disable-doxygen \
--with-system-ssl-certs=/etc/ssl/certs || return 1
cd libpurple/protocols/fetion
make || return 1
mkdir -p $pkgdir/usr/lib/purple-2 || return 1
mv .libs/libfetion.so $pkgdir/usr/lib/purple-2/


}
md5sums=('4f348c0e78aa686f4857949512285eae'
'8d0ff6215b2d023eaa8efef59097ef83'
'fc8a37c4c9c00773b900f59c005a09df'
'f8789e38d2dfee0f64687c32c07ea1cb'
'7845b5b5f263f48790939cd9e31dc375'
'42e8eb10db1f67dff261147885037a9d')


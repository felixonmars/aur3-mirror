# Michal Ochocinski <michal@ochocinski.com.pl>
pkgname=rtmpdump-weeb.tv
pkgver=2.4
pkgrel=1
pkgdesc="rtmpdump with weeb.tv support"
arch=('i686' 'x86_64')
url="http://rtmpdump.mplayerhq.hu/"
license=('GPL2' 'LGPL2.1')
depends=('openssl')
makedepends=('git' 'wget' 'patch')
conflicts=('rtmpdump' 'rtmpdump-git' 'rtmpdump-svn')
provides=('rtmpdump')
source=()
md5sums=()

git="git://git.ffmpeg.org/rtmpdump"
patch_name='rtmpdump-git20111213-0001-weebtv.patch'
patch="http://sd-xbmc.googlecode.com/files/rtmpdump-git20111213-0001-weebtv.patch"

build() {
	cd $srcdir
	git clone $git
	cd rtmpdump
	wget $patch
	patch -p1 < $patch_name
	sed -i -e 's/LIBS=$(LIB_RTMP) $(CRYPTO_LIB) $(LIBS_$(SYS)) $(XLIBS)/LIBS=$(LIB_RTMP) $(CRYPTO_LIB) $(LIBS_$(SYS)) $(XLIBS) -lm/' Makefile	
	make -j2
}

package() {
	cd $srcdir/rtmpdump
	install -d -m755 "${pkgdir}/usr/lib"
	make prefix=/usr DESTDIR=$pkgdir install
}

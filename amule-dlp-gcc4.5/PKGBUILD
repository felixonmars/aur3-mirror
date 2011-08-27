#  2010-MAR-01 10:23:55  hasee.wu 
# Maintainer: Hasee Wu <hasee.wu@gmail.com>
# Contributor:  midoriumi <gs@bbxy.net>
# http://www.gsea.com.cn/ 
# http://code.google.com/p/libantixunlei/  
# http://forum.ubuntu.org.cn/viewtopic.php?f=73&t=232845
# http://forum.ubuntu.org.cn/viewtopic.php?f=73&t=232845&start=115
# http://forum.ubuntu.org.cn/viewtopic.php?f=73&t=232845&start=125

pkgname=amule-dlp-gcc4.5
_pkgname=amule
pkgver=2.2.6
pkgrel=DLP3905
#_pkgrel=BillEnh03
pkgdesc="An eMule-like client for ed2k p2p network with DLP patch enhanced by Bill Lee"
arch=('i686' 'x86_64')
url="http://www.amule.org"
license=('GPL')
depends=('wxgtk>=2.8.10.1' 'gd>=2.0.35' 'geoip' 'binutils>=2.19.1' 'libupnp')
makedepends=('crypto++')
conflicts=('amule' 'amule-devel' 'amule-remote-upnp' 'amule-remote' 'amule-upnp' 'amule-adnza' 'amule-adnza-svn')
provides=("amule=$pkgver")
source=("http://downloads.sourceforge.net/sourceforge/${_pkgname}/aMule-${pkgver}.tar.bz2"
"aMule-${pkgver}-${pkgrel}.patch" "gcc4.5.patch")
md5sums=('530d9b48187e36f78fc21bb19e94326d'
'e52672d46c8cefb24feed8b3b0c93659'
'3fd54cf2d58c9699246ca9c8e485eda7')

build() {
cd ${srcdir}/aMule-${pkgver}
patch -p0 -N < ../aMule-${pkgver}-${pkgrel}.patch
patch -p0 -N < ../gcc4.5.patch
#patch -p0 -N < ../aMule-${pkgver}-${pkgrel}-${_pkgrel}.patch

./configure --prefix=/usr --disable-debug --enable-optimize --enable-upnp --enable-geoip --enable-nls --enable-amulecmd --enable-alcc -enable-alc --enable-cas --enable-wxcas --enable-mmap --enable-amule-daemon --enable-webserver

make || return 1
make DESTDIR=${pkgdir}/ install || return 1
}

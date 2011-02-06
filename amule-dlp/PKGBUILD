#  2010-May-27 10:23:55  hasee.wu 
# Maintainer: Hasee Wu <hasee.wu@gmail.com>
# Contributor:  midoriumi <gs@bbxy.net>
# http://www.gsea.com.cn/ 
# http://code.google.com/p/libantixunlei/  
# http://forum.ubuntu.org.cn/viewtopic.php?f=73&t=232845
# http://forum.ubuntu.org.cn/viewtopic.php?f=73&t=232845&start=115
# http://forum.ubuntu.org.cn/viewtopic.php?f=73&t=232845&start=125
# http://forum.ubuntu.org.cn/viewtopic.php?f=73&t=273010&start=0
# http://code.google.com/p/amule-dlp/

pkgname=amule-dlp
_pkgname=amule
pkgver=2.2.6
pkgrel=DLP4201
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
"aMule-${pkgver}-${pkgrel}.patch")
md5sums=('530d9b48187e36f78fc21bb19e94326d'
'17c41814d2f9435d81e362b1285e13d2')

build() {
cd ${srcdir}/aMule-${pkgver}
patch -p1 -N < ../aMule-${pkgver}-${pkgrel}.patch
#patch -p0 -N < ../aMule-${pkgver}-${pkgrel}-${_pkgrel}.patch

./configure --prefix=/usr --disable-debug --enable-optimize --with-denoise-level=3 --enable-upnp --enable-geoip --enable-nls --enable-amule-daemon --enable-amulecmd --enable-webserver --enable-alcc -enable-alc --enable-cas --enable-wxcas --enable-mmap --with-crypto

make || return 1
make DESTDIR=${pkgdir}/ install || return 1
}

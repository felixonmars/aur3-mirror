# Maintainer : felipe.facundes <felipe.facundes@gmail.com>
pkgbase=lightspark-debian
pkgname=('lightspark-bin' 'lightspark-common' 'browser-plugin-lightspark')
pkgver=_0.7.2
pkgrel=6
pkgdesc="An alternative, open source Flash Player for Linux."
url="http://lightspark.sourceforge.net"
arch=('x86_64')
license=('LGPLv3')
depends=('libtinfo' 'pcre' 'xz' 'libjpeg6' 'libcurl-gnutls' 'gtk2' 'ffmpeg' 'glew' 'curl' 'boost-libs' 'libxml++' 'desktop-file-utils')
source=('http://mirror.nus.edu.sg/Debian/pool/main/l/lightspark/lightspark_0.7.2-6_amd64.deb' 
'http://mirror.nus.edu.sg/Debian/pool/main/l/lightspark/lightspark-common_0.7.2-6_amd64.deb'
'http://mirror.nus.edu.sg/Debian/pool/main/l/lightspark/browser-plugin-lightspark_0.7.2-6_amd64.deb')
conflicts=('lightspark' 'lightspark-git' 'lightspark-local' 'flashplugin' 'glew1.10')
#provides=('lightspark' 'lightspark-git' 'flashplugin' 'lightspark-local')
optdepends=('gnash-gtk: fallback support')
md5sums=('726b4ac4c6d00270cb2625e017efaedf'
'be558a837aaf19bbff3a86b0c6609df6'
'7670b2226f37fc60c25c49f3bba1752a')

package_lightspark-bin() {
rm -rf src
mkdir src
cp lightspark_0.7.2-6_amd64.deb src/
cd ${srcdir}/
ar -x lightspark_0.7.2-6_amd64.deb
install -m755 -d ${pkgdir}/usr/lib/bin/
tar -xJf ${srcdir}/data.tar.xz -C ${pkgdir}/
install -m755 -d ${pkgdir}/usr/lib/
ln -s /usr/lib/libboost_filesystem.so.1.56.0 ${pkgdir}/usr/lib/libboost_filesystem.so.1.55.0
ln -s /usr/lib/libboost_system.so.1.56.0 ${pkgdir}/usr/lib/libboost_system.so.1.55.0
ln -s /usr/lib/libpcre.so.1.2.4 ${pkgdir}/usr/lib/libpcre.so.3
ln -s /usr/lib/libGLEW.so.1.11.0 ${pkgdir}/usr/lib/libGLEW.so.1.10
ln -s /usr/lib/libGLEW.so.1.11.0 ${pkgdir}/usr/lib/libGLEW.so.1.10.0
ln -s /usr/lib/libGLEWmx.so.1.11.0 ${pkgdir}/usr/lib/libGLEWmx.so.1.10
ln -s /usr/lib/libGLEWmx.so.1.11.0 ${pkgdir}/usr/lib/libGLEWmx.so.1.10.0
} 

package_lightspark-common() {
rm -rf src
mkdir src
cp lightspark-common_0.7.2-6_amd64.deb src/
cd ${srcdir}/
ar -x lightspark-common_0.7.2-6_amd64.deb
tar -xJf ${srcdir}/data.tar.xz -C ${pkgdir}/
mkdir -p ${pkgdir}/mozilla/plugins
install -m755 -d ${pkgdir}/usr/lib/mozilla/plugins/
ln -s /usr/lib/lightspark/plugins/liblightsparksdlplugin.so ${pkgdir}/usr/lib/mozilla/plugins/liblightsparksdlplugin.so
ln -s /usr/lib/lightspark/plugins/liblightsparkpulseplugin.so ${pkgdir}/usr/lib/mozilla/plugins/liblightsparkpulseplugin.so
ln -s /usr/lib/lightspark/liblightspark.so.0.7.2 ${pkgdir}/usr/lib/mozilla/plugins/liblightspark.so.0.7.2
ln -s /usr/lib/lightspark/liblightspark.so.0.7.2 ${pkgdir}/usr/lib/mozilla/plugins/liblightspark.so.0.7
ln -s /usr/lib/lightspark/liblightspark.so.0.7.2 ${pkgdir}/usr/lib/mozilla/plugins/liblightspark.so
ln -s /usr/lib/lightspark/lightspark ${pkgdir}/usr/lib/mozilla/plugins/lightspark
} 

package_browser-plugin-lightspark() {
rm -rf src
mkdir src
cp browser-plugin-lightspark_0.7.2-6_amd64.deb src/
cd ${srcdir}/
ar -x browser-plugin-lightspark_0.7.2-6_amd64.deb
tar -xJf ${srcdir}/data.tar.xz -C ${pkgdir}/
install -m755 -d ${pkgdir}/usr/lib/mozilla/plugins/
ln -s /usr/lib/lightspark/liblightsparkplugin.so ${pkgdir}/usr/lib/mozilla/plugins/liblightsparkplugin.so
} 
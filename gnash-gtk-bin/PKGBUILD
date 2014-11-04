# Maintainer : felipe.facundes <felipe.facundes@gmail.com>
pkgbase=gnash-gtk-bin
pkgname=('gnash-gtk' 'gnash-common')
pkgver=_0.8.10
pkgrel=10
pkgdesc="An alternative, open source Flash Player for Linux."
url="http://lightspark.sourceforge.net"
arch=('x86_64')
license=('LGPLv3')
depends=('libtinfo' 'pcre' 'xz' 'libjpeg6' 'libcurl-gnutls' 'gtk2' 'ffmpeg' 'glew' 'curl' 'boost-libs' 'libxml++' 'desktop-file-utils')
source=('http://gaming.jhu.edu/mirror/archlinux/community/os/x86_64/gnash-gtk-0.8.10-10-x86_64.pkg.tar.xz' 
'http://gaming.jhu.edu/mirror/archlinux/community/os/x86_64/gnash-common-0.8.10-10-x86_64.pkg.tar.xz')
conflicts=('flashplugin')
#provides=('lightspark' 'lightspark-git' 'flashplugin' 'lightspark-local')
optdepends=('lightspark-bin: browser support')
md5sums=('d7591607b93bb9621fd80a1b9a95dd4b'
'5d8ed4d0a10a9d3000b89929fe833baa')

package_gnash-gtk() {
tar -xJf gnash-gtk-0.8.10-10-x86_64.pkg.tar.xz -C ${pkgdir}/
} 

package_gnash-common() {
tar -xJf gnash-common-0.8.10-10-x86_64.pkg.tar.xz -C ${pkgdir}/
install -m755 -d ${pkgdir}/usr/lib/
ln -s /usr/lib/libgif.so.7.0.0 ${pkgdir}/usr/lib/libgif.so.6
ln -s /usr/lib/libboost_thread.so.1.56.0 ${pkgdir}/usr/lib/libboost_thread.so.1.54.0
ln -s /usr/lib/libboost_system.so.1.56.0 ${pkgdir}/usr/lib/libboost_system.so.1.54.0
ln -s /usr/lib/libboost_program_options.so.1.56.0 ${pkgdir}/usr/lib/libboost_program_options.so.1.54.0
} 

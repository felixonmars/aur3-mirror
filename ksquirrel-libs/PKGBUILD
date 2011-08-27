# Contributor: Ronald van Haren <ronald.archlinux.org>
 
 pkgname=ksquirrel-libs
 pkgver=0.8.0
 pkgrel=3
 pkgdesc="A set of image codecs for ksquirrel"
 url="http://ksquirrel.sourceforge.net/"
 license=('GPL2' 'LGPL' 'custom:jasper' 'custom:ljpeg' 'custom:mng' 'custom:png')
 source=(http://downloads.sourceforge.net/ksquirrel/$pkgname-$pkgver.tar.bz2 
	'ksquirrel-libs-0.8.0-gcc43.patch' 'ksquirrel-libs-0.8.0-gcc44.patch')
 options=(!libtool)
 arch=('i686' 'x86_64')
 md5sums=('a34ba56739d0c878fb888a834512b2cf' '724945fa457883382f6eb5a67d88db20'
         '5bd521d60baf8e49f3964ccc55795833')
 
 build() {
 cd ${srcdir}/${pkgname}-${pkgver}

 # gcc43 & gcc44 build patches
 patch -Np1 -i ${srcdir}/ksquirrel-libs-0.8.0-gcc43.patch || return 1
 patch -Np1 -i ${srcdir}/ksquirrel-libs-0.8.0-gcc44.patch || return 1

 ./configure --prefix=/opt/kde
 make || return 1
 make DESTDIR=${pkgdir} install || return 1
 
 # install custom license files
 install -Dm644 COPYING ${pkgdir}/usr/share/licenses/ksquirrel-libs/COPYING
 install -Dm644 LICENSE.JASPER ${pkgdir}/usr/share/licenses/ksquirrel-libs/license.jasper
 install -Dm644 LICENSE.LJPEG ${pkgdir}/usr/share/licenses/ksquirrel-libs/license.ljpeg
 install -Dm644 LICENSE.MNG ${pkgdir}/usr/share/licenses/ksquirrel-libs/license.mng
 install -Dm644 LICENSE.PNG ${pkgdir}/usr/share/licenses/ksquirrel-libs/license.png

 }

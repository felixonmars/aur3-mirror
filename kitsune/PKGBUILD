# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=kitsune
pkgver=2.0
pkgrel=3
pkgdesc="Software that solves numbers problem from a french TV show."
arch=('i686' 'x86_64')
url="http://kitsune.tuxfamily.org" 
license="GPL"
depends=('qt>=4.2')
makedepends=('make')
source=('http://download.tuxfamily.org/kitsune/kitsune2.0/kitsune2.0.tar.gz' \
        'http://download.tuxfamily.org/kitsune/icons/kitsune-128.png' 'kitsune.desktop')
md5sums=('1a1388bd2c74b28b48f46eeba3d0166c' 'ef64dda38396d6b2fa396ec35bebf43b' 'ce7a0361b974710c90d0d5503f375858')

build() { 
	cd ${srcdir}/kitsune2.0 
        qmake || return 1
        lrelease kitsune.pro || return 1
	make || return 1
        mkdir -p ${pkgdir}/usr/bin  
        mkdir -p ${pkgdir}/usr/share/{kitsune,applications} 
        install -m755 bin/kitsune ${pkgdir}/usr/bin
        install ${srcdir}/kitsune-128.png  ${pkgdir}/usr/share/kitsune
        install ${srcdir}/kitsune.desktop ${pkgdir}/usr/share/applications
}

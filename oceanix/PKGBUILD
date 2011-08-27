# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=oceanix
pkgver=none
pkgrel=4
pkgdesc="Match-3 Game"
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
arch=('i686' 'x86_64')
url="http://www.bigfishgames.com/download-games/3180/oceanix/index.html" 
license="free"
depends=('openal')
makedepends=('make')
source=(http://www.dl.nalty.ru/OceaniX.zip  oceanix.desktop)
md5sums=('f3b806c451067b0e3c5273702db6b78b' '19d3791d70a4a55f09214a98ea4bc7e8')

build() { 
	cd ${srcdir}/OceaniX 
        mkdir -p ${pkgdir}/usr/bin
        mkdir -p ${pkgdir}/usr/share/{OceaniX,applications}
        if [ "$CARCH" == "i686" ]; then
            echo "cd '/usr/share/OceaniX/' && ./OceaniX.x86" > ${pkgdir}/usr/bin/oceanix.sh
            cp -R OceaniX.app ${pkgdir}/usr/share/OceaniX
	    install -m755 OceaniX.x86 ${pkgdir}/usr/share/OceaniX
	else 
	    echo "cd '/usr/share/OceaniX/' && ./OceaniX.x86_64" > ${pkgdir}/usr/bin/oceanix.sh
	    cp -R OceaniX.app ${pkgdir}/usr/share/OceaniX
	    install -m755 OceaniX.x86_64 ${pkgdir}/usr/share/OceaniX
	fi
        chmod 755 ${pkgdir}/usr/bin/oceanix.sh 
        install ${srcdir}/oceanix.desktop ${pkgdir}/usr/share/applications
}

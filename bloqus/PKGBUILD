# Maintainer: Chris Simons <chris@simonsmail.net>
pkgname=bloqus
pkgver=1.0.0
pkgrel=1
pkgdesc="Inspired by the game Blokus, you have to place polyominos on a board (a grid)."
arch=('i686' 'x86_64')
url="http://bloqus.tuxfamily.org/" 
license="CeCILL 2"
depends=('qt4')
makedepends=('make')
source=(http://download.tuxfamily.org/$pkgname/${pkgname}-${pkgver}-src.tar.bz2 bloqus.desktop)
md5sums=('2c94760be55c3b1c0076ffad99b3a076' '6e4aae9ebbeaa5f0e787bc2d7901805a ')

build() { 
	cd ${srcdir}/${pkgname}-${pkgver} 
        # Remove background images that obscure the buttons and text
        for i in grey_bg.png marble_white_128.png marble_white_64.png
            do
                rm images/$i
                touch images/$i
        done

        qmake-qt4
	make release|| return 1
        mkdir -p ${pkgdir}/usr/bin  
        mkdir -p ${pkgdir}/usr/share/{bloqus,applications} 
        install -m 755 bloqus ${pkgdir}/usr/bin
        install images/bloqus_icon_48.png ${pkgdir}/usr/share/bloqus
        install ${srcdir}/bloqus.desktop ${pkgdir}/usr/share/applications
}

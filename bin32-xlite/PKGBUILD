# Mantainer: Christopher luna <archlinux A christopher d4sH luna d0t com>
# Contributor: Michalis Georgiou <mikes@archlinux.gr>
pkgname=bin32-xlite
_pkgname=xlite
pkgver=2.0
pkgrel=7
pkgdesc="a multiplatform fully functioning softphone (binary only)"
arch=('x86_64')
url="http://www.counterpath.net/x-lite"
license=('custom')
source=("http://telefonia.um.es/descargas/X-Lite_Install.tar.gz" "xlite.desktop" "xlite.xpm" "xlite_16x16.xpm" "xlite_32x32.xpm" "xlite_48x48.xpm")
depends=('libstdc++5' 'lib32-libglade' 'lib32-libstdc++5' 'lib32-libxdamage' 'lib32-qt' 'lib32-gtk2')

md5sums=('6041fa4b2c553407373e6020c55da4ae'
		'cb657c6f1de553de3e90079e97f1b1ea'
		'b5fb4851fce3b7992ba527e876233aa6'
		'9a8c29134786e2328b0ac2c58c163e8f'
		'3c4aa153c5bcbb424eda456857a65f2b'
		'4dd49730533e40c0ead3874717d7a8c1')

build() {
        install -Dm 644 $srcdir/xlite.xpm "$pkgdir/usr/share/pixmaps/$_pkgname.xpm" || return 1
        install -Dm 644 $srcdir/xlite_16x16.xpm "$pkgdir/usr/share/icons/hicolor/16x16/$_pkgname.xpm" || return 1
        install -Dm 644 $srcdir/xlite_32x32.xpm "$pkgdir/usr/share/icons/hicolor/32x32/$_pkgname.xpm" || return 1
        install -Dm 644 $srcdir/xlite_48x48.xpm "$pkgdir/usr/share/icons/hicolor/48x48/$_pkgname.xpm" || return 1
        
        cd $srcdir/xten-xlite 
        mkdir -p ${pkgdir}/opt/${_pkgname} 
        install -Dm 755 xtensoftphone $pkgdir/opt/$_pkgname/ || return 1
        install -Dm 644 $srcdir/xlite.desktop $pkgdir/usr/share/applications/$_pkgname.desktop || return 1
        

        
	}






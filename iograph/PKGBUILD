# Maintainer: Joost Bremmer < toost dot b at gmail dot com>
pkgname=iograph
pkgver=1.0.1
pkgrel=1
pkgdesc="an application that turns mouse movements into modern art"
arch=(any)
url="http://iographica.com/"
license=('custom')
depends=('java-runtime'
'desktop-file-utils')
source=('iograph' 
'iograph.desktop'
'iograph.png'
"${pkgname}.jar"::http://iographica.com/download/linux/IOGraph_v1_0_1.jar)
noextract=(${pkgname}.jar)
install=iograph.install
sha256sums=('25167470e02e953f023a7dcb6d9cbb61ba4677bc64490b99674aa065f90b2a88'
            '1f8c18981b0203b4037f62a18679cb10774810331636188a9517a7da287eae1a'
	    '72ef426162886d3ee3f298a967c399f94aec560dba1cb76b476295e6c1dc64bf'
	    'aa32de758a1a076d5a14461216b3298f60ae99650f7b3b314224c6c792b35cac')
package() {
	cd "$srcdir/"


        #executables
	install -D -m755 "${srcdir}/iograph"         "${pkgdir}/usr/bin/iograph"
	install -D -m644 "${srcdir}/iograph.jar"     "${pkgdir}/usr/share/java/iograph/iograph.jar"

        #desktop files
	install -D -m644 "${srcdir}/iograph.desktop" "${pkgdir}/usr/share/applications/iograph.desktop"
	install -D -m644 "${srcdir}/iograph.png"     "${pkgdir}/usr/share/pixmaps/iograph.png"
	
}

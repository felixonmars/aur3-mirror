# Maintainer: Reventlov <nontunauraspasmonmail@gmail.com>
pkgname=semp_reg-fonts
pkgver=3
pkgrel=0
pkgdesc='Semplice Regular Font.'
depends=()
arch=(any)
source=('http://pixelfonts.style-force.net/zip/semp_reg.zip' 'LICENSE.txt' 'semp_reg-fonts.install')
md5sums=('ec64e55e715ecba4f350d2cdb34e9dbd'
         '2adf1711dd76de2582eef851c7e04e84'
         '58f7ac5ab595722dac603f26373c976b')
url='http://pixelfonts.style-force.net/download/semplice-regular/'
license=('custom')
 
package() {
        install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -dm755 ${pkgdir}/usr/share/fonts/TTF
	install -Dm755 ${srcdir}/semp_reg/SEMPRG__.TTF ${pkgdir}/usr/share/fonts/TTF/SEMPRG__.TTF

}


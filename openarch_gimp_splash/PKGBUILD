# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_gimp_splash
pkgver=0.1
pkgrel=2
pkgdesc="GIMP splash for openarch"
arch=('any')
url="http://lagadesk.deviantart.com"
groups=('openarch_gray')
license=('GPL')
depends=('gimp')
groups=('openarch')
install=("gimp_splash.install")
source=('http://www.deviantart.com/download/161375760/MoNOChrome_GIMP_Splash_by_LaGaDesk.zip'
	'AUTHORS' 'gimp.png')

build() {
	install -d -m755 "${pkgdir}"/usr/share/gimp/2.0/images
	install -D -m644 "${srcdir}"/MoNOChrome-Gimp-Splash/gimp-splash.png  "${pkgdir}"/usr/share/gimp/2.0/images/gimp-splash.png_new
	install -D -m644 "${srcdir}"/gimp.png  "${pkgdir}"/usr/share/gimp/2.0/images/gimp-logo.png_new
	install -D -m644 "${srcdir}"/gimp.png  "${pkgdir}"/usr/share/gimp/2.0/images/wilber.png_new
	install -D -m644 "${srcdir}"/AUTHORS "${pkgdir}"/usr/share/doc/openarch_gimp_splash/AUTHORS
}
md5sums=('a3d81c79760cf2dc52622d19d3fcd507'
         'cde2b52233bd51ccd946810abe311e66'
         '3773dd6740e62b5cde6e90502cfbdf59')

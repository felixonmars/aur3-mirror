# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

pkgname=archdroid-icon-theme
pkgver=r42.126c29e
pkgrel=1
pkgdesc="Port of Android 5.0 Lollipop's material design icons to Arch."
arch=('any')
url="https://github.com/GreenRaccoon23/${pkgname}"
license=('GPL3')
makedepends=('intltool' 'librsvg' 'gtk-update-icon-cache' 'xz')
provides=("${pkgname}")
conflicts=("${pkgname}")
#options=('!strip')
install="${pkgname}.install"
source=("https://github.com/GreenRaccoon23/${pkgname}/raw/master/${pkgname}.tar.xz")
md5sums=("d898157cbc663b424186c0b943b1d2da")

package() {
	_pkgz="${pkgname}.tar.xz" ;
	msg2 "Extracting ${_pkgz}..." ;
	bsdtar -xf ${_pkgz} -C "$pkgdir/" ;
	
	msg2 "Installing ${pkgname}..." ;
	cd ${pkgname} ;
  	install -dm 755 "${pkgdir}"/usr/share/icons
  	cp -drf --no-preserve='ownership' . "${pkgdir}"/usr/share/icons/
}


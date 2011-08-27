# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-desktop-info
pkgver=0.24
pkgrel=2
pkgdesc="Conky-like desktop information application with HTML support."
arch=('i686' 'x86_64')
url="https://launchpad.net/~m-buck/+archive/gtk-desktop-info"
license=('GPL3')
depends=('python-gdata' 'pywebkitgtk' 'python-xlib' 'python-imaging')
source=(https://launchpad.net/~m-buck/+archive/${pkgname}/+files/${pkgname}_${pkgver}.tar.gz
        https://launchpad.net/~m-buck/+archive/${pkgname}/+files/${pkgname}-data_0.13.tar.gz
	gtk-desktop-info.guide)
md5sums=('191e87b818ac2292855d46ae575c67e7'
         'b2d41d299de3c98825dd6950ec217cbc'
	 '4b787bbedd4e31d0bddbf0fbaf665245')

build() {
	/bin/true
}

package() {
	cd ${srcdir}/src

	install -d ${pkgdir}/usr/{bin,share/${pkgname}}
	cp -R * ${pkgdir}/usr/share/${pkgname}
	install -Dm 755 ${pkgdir}/usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/
	install -Dm 755 ${srcdir}/${pkgname}.guide ${pkgdir}/usr/bin/
}


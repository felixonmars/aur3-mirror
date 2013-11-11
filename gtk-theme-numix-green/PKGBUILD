# Maintainer: TuxStorm

pkgname=gtk-theme-numix-green
_theme=NumixGreen
pkgver=1.02
pkgrel=1
pkgdesc="Green rendition of the Numix theme"
arch=('any')
url="https://launchpad.net/~yunnxx"
license=('GPL3')
depends=('gtk-engine-murrine')
source=https://launchpad.net/~yunnxx/+archive/gnome3/+files/numixgreen-theme_1.02ubuntutodaysaucy-1ubuntu1_all.deb
md5sums=('190b3ccfc1117826f6abf031d8d68be7')

build() {
	cd ${startdir}/src
	#########ar -x ${startdir}/src/dfm_${pkgver}_${ARCH}.deb
	tar -zxf ${startdir}/src/data.tar.gz
	cp -r ${startdir}/src/usr/ ${startdir}/pkg/

# install theme
	install -d "$pkgdir/usr/share/themes/${_theme}"
	cp -rv ${srcdir}/usr/share/themes/${_theme}/* "$pkgdir/usr/share/themes/${_theme}"
}
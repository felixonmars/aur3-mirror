# Maintainer: Nicky726 (nicky726 <at> gmail <dot> com)
# Contributor: Sacro (ben <at> benwoodward <dot> me <dot> uk)
pkgname=openttd-32bpp
pkgver=1.1.0
pkgrel=4
epoch=1
pkgdesc="An engine for running Transport Tycoon Deluxe with experimental 32bpp patch"
arch=('i686' 'x86_64')
url="http://wiki.openttd.org/32bpp_Extra_Zoom_Levels"
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'lzo2' 'fontconfig' 'hicolor-icon-theme' 'desktop-file-utils'
	 'openttd-opengfx' 'openttd-opensfx')
makedepends=('gcc46')
install=${pkgname}.install
source=(http://bundles.openttdcoop.org/32bpp-ez/${pkgver}/${pkgname}-ez-${pkgver}-source.tar.xz)
md5sums=('5b3d7f3769fb7743dd325e08667cce67')

build() {
	cd "${srcdir}/${pkgname}-ez-${pkgver}"

	export CC=gcc-4.6 CXX=g++-4.6
	# Configure it, so the user can have other versions of the game 
	# installed and running without troubles
	./configure --prefix-dir=/usr --binary-name=${pkgname} --binary-dir=bin \
		--data-dir=share/${pkgname} --install-dir=${pkgdir} --doc-dir=share/doc/${pkgname} \
		--menu-name="OpenTTD" --personal-dir=.${pkgname}

	make
}

package(){
	cd "${srcdir}/${pkgname}-ez-${pkgver}"

	make install

	# Link opengfx and opensfx files, so that the game runs
	cd "${pkgdir}/usr/share/${pkgname}/data/"
	ln -s /usr/share/openttd/data/ogfx1_base.grf ogfx1_base.grf
	ln -s /usr/share/openttd/data/ogfxc_arctic.grf ogfxc_arctic.grf
	ln -s /usr/share/openttd/data/ogfxe_extra.grf ogfxe_extra.grf
	ln -s /usr/share/openttd/data/ogfxh_tropical.grf ogfxh_tropical.grf
	ln -s /usr/share/openttd/data/ogfxi_logos.grf ogfxi_logos.grf
	ln -s /usr/share/openttd/data/ogfxt_toyland.grf ogfxt_toyland.grf
	ln -s /usr/share/openttd/data/opengfx.obg opengfx.obg
	ln -s /usr/share/openttd/data/opensfx.cat opensfx.cat
	ln -s /usr/share/openttd/data/opensfx.obs opensfx.obs
}

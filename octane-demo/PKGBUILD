# Maintainer : gandalf3 <zzyxpaw at gmail dot com>
# Contributer: N30N <archlinux@alunamation.com>


pkgname="octane-demo"
pkgver=1.5
pkgrel=1
pkgdesc="A proprietary GPU based, unbiased, physically based renderer (demo version)."
url="http://render.otoy.com/"
license=("unknown") #no license file in the download and nothing on their website..
arch=("x86_64")
depends=("cuda" "glew" "freetype2")
makedepends=("unzip")
options=("!strip")
source=("http://render.otoy.com/downloads/OctaneRender_demo_1_50_linux.zip" \
	"http://render.otoy.com/images/octanerender_logo.png" \
	"octane_demo.desktop" \
	"octane_demo.install" \
	"octane_demo")
md5sums=("7ef5144c38a9946d3ca0f062392674c8" \
	"8908272f529723b2980ce06c8f1f4aca" \
	"f666c1d90b6aa83a24be8535724cd871" \
	"a18b972bb03540c1c9689c9b67d64614" \
	"5ed3c28991593b05f382bf6343eb9e2a")

noextract=("OctaneRender_demo_1_50_linux.zip")

prepare() {
	unzip -o "OctaneRender_demo_1_50_linux.zip"
}
	
	
package() {
	install -D -m755 "${srcdir}/octane_demo" "${pkgdir}/usr/bin/octane_demo" #shell script so there is something in /usr/bin
	
	install -D -m755 "${srcdir}/OctaneRender_demo_1_50_linux/octane_demo" "${pkgdir}/opt/octane_demo/octane_demo" #put in /opt because it requires octane.dat to be in the same directory
	install -D -m644 "${srcdir}/OctaneRender_demo_1_50_linux/octane.dat" "${pkgdir}/opt/octane_demo/octane.dat"
	#install -D -m644 Octane_LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m644 "${srcdir}/octanerender_logo.png" "${pkgdir}/usr/share/pixmaps/octane_demo.png"
	install -D -m644 "${srcdir}/octane_demo.desktop" "${pkgdir}/usr/share/applications/octane_demo.desktop"
}

# vim: set noet ff=unix:

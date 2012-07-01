pkgname=stressitout
pkgver=0.1
pkgrel=1
pkgdesc="StressItOut (or SIO, for short) is a free (as in freedom) hardware stressing and testing program for GNU/Linux writen on Qt"
arch=('i686' 'x86_64')
url='http://qt-apps.org/content/show.php/StressItOut?content=136985'
license=('GPL2')
depends=('qt' 'lm_sensors' 'mesa')
source=("http://qt-apps.org/CONTENT/content-files/136985-${pkgname}-v${pkgver}-src.tar.gz")
md5sums=('dc1ce96bb7f5b30a737e4df6479c27a3')

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    if [[ -d build ]]; then
	rm -rf build
    fi
    mkdir build && cd build
    qmake ..
    make
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    install -Dm 755 build/stressitout ${pkgdir}/usr/bin/stressitout
    install -Dm 644 stressitout.desktop ${pkgdir}/usr/share/applications/stressitout.desktop
    install -Dm 644 icon/64x64/stressitout.png ${pkgdir}/usr/share/pixmaps/stressitout.png
}
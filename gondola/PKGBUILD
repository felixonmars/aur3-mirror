# Maintainer: Fabio Zanini <fabio.zanini@fastmail.fm>

pkgname=gondola
pkgver=1.1
pkgrel=5
pkgdesc="The ultimate shipping, shape sorting, barge unloading game of all time."
arch=('i686' 'x86_64')
url="http://arcticpaint.com/gondola/" 
license="GPL3"
depends=('python-rabbyt>=0.8.2' 'pyglet' 'avbin')
source=(http://files.arcticpaint.com/gondola/Gondola-${pkgver}-src.zip gondola.desktop gondola.install)
md5sums=('21aafd709b4270725ed7e27fc59bdeb8' '0a735e0b90a80e02547d365769576958' 'ec724da6c259eb66faacf30c666e3c5d')
install=gondola.install
build() { 
	cd ${srcdir}/Gondola-$pkgver
        mkdir -p ${pkgdir}/usr/bin
        mkdir -p ${pkgdir}/usr/share/{gondola,applications}
        cp -R * ${pkgdir}/usr/share/gondola
        echo "cd '/usr/share/gondola/' && python2 run_game.py" > ${pkgdir}/usr/bin/gondola.sh
        chmod 755 ${pkgdir}/usr/bin/gondola.sh
        install ${srcdir}/gondola.desktop ${pkgdir}/usr/share/applications
}

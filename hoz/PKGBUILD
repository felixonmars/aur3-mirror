# Contributor: Javier ‘Phrodo_00’ Aravena <phrodo.00@gmail.com>
pkgname=hoz
pkgver=1.65
pkgrel=5
pkgdesc="HOZ is a file splitter. Its file format is the same as the one used by the 'Hacha' software"
url="http://hoz.sourceforge.net/"
license="gpl"
arch=('i686' 'x86_64')
source=("http://${pkgname}.sourceforge.net/download/${pkgname}-165.tar.gz")
md5sums=('84287a9e50cb96dc20e4444dc74d64a0')

build() {
    #Change the 'EN' downhere to either ES or FR to compile in Spanish or french respectively
    LANGUAGE='EN'	
    cd ${srcdir}/${pkgname}-165
    mkdir build
    make LANG=-DHOZ_LANG_${LANGUAGE} BIN=build/hoz cli
}

package() {
    cd ${srcdir}/${pkgname}-165
    install -m755 -D build/hoz ${pkgdir}/usr/bin/hoz
}

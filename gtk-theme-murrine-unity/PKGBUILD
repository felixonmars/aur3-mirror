# Contributor: Tony Upton <celticmusicguy at gmail dot com>

pkgname=gtk-theme-murrine-unity
pkgver=20110619
pkgrel=2
pkgdesc="A clean and simple GTK theme using the Murrine engine and a matching Metacity theme"
arch=('i686' 'x86_64')
url="http://code.google.com/p/murrine-unity-project/"
license=('GPL')
depends=('gtk-engine-murrine')
source=('http://murrine-unity-project.googlecode.com/files/Murrine-Unity-GTK2-20110619.tar.gz')
md5sums=('aebff0a94ba6adfecebdd7ab67cfde8b')

build() {
    cd "${srcdir}"
    install -d -m755 "${pkgdir}/usr/share/themes"
    cp -ar Murrine-Unity "${pkgdir}/usr/share/themes"
}



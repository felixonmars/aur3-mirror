# Author : Piotr Grzeszczak <piotrek91666@o2.pl>
# Contributor: Esclapion <esclapion@gmail.com>
# Maintainer: aaditya <aaditya_gnulinux@zoho.com>
    
pkgname=qtlogout-consolekit
pkgver=0.1
pkgrel=2
pkgdesc="Qt based logout menu for LXQt"
arch=('i686' 'x86_64')
url="https://forum.manjaro.org/index.php?topic=15538.0"
license=('GPL')
depends=('qt4' 'consolekit')
makedepends=('qtchooser')
provides=('qtlogout')
conflicts=('qtlogout' 'qlogout')
replaces=('qtlogout')
source=("http://sourceforge.net/projects/mefiles/files/Manjaro/$pkgname-$pkgver.tar.gz" "qlogout.desktop")
md5sums=('39fb606d7ecd937f4d273016f7364d7e' 'a3cc11bd7f157eb8f45a5d4994d995c3')
     
build() {
            cd "$srcdir/$pkgname-$pkgver"
            qmake-qt4 "INSTALL_PREFIX=/usr"
}
     
package() {
            cd "$srcdir/$pkgname-$pkgver"
            make INSTALLROOT="$pkgdir/" install

	    install -Dm755 "qtLogout" "${pkgdir}/usr/bin/qtLogout"
	    install -Dm755 "${srcdir}/qlogout.desktop" "${pkgdir}/usr/share/applications/qlogout.desktop"
}


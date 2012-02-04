# Maintainer: SoleSoul <j.lahav ta gmail tod com>
# maintainer: Meow < meow at linux dot cn >
pkgname=downloadm-aria2
pkgver=0.1.2
pkgrel=2
pkgdesc="A download accelerator/manager which uses aria2c as a backend."
arch=('i686' 'x86_64')
url="http://sourceforge.net/p/downloadm/"
license=('GPL')
depends=('gtkmm' 'xmlrpc-c' 'aria2' 'libsigc++')
makedepends=('qt')
source=("http://downloads.sourceforge.net/project/downloadm/DownloadM-$pkgver.tar.gz"
		'downloadm.desktop'
		'downloadm.install')
md5sums=('6f44e5b334d3c87807c72c88c0b32cb5'
		 '4f5884af1aa22ecf9cc55dfc0445c371'
		 '7ae0d6b02dfaadf126a8388b0147b94b')
install=downloadm.install
conflicts=('downloadm')
provides=("downloadm=$pkgver")
build() {
    cd DownloadM

    cd Entities
    qmake && make

    cd ../aria2c_com
    qmake && make
    
    cd ../DownloadM
    qmake && make

    cd ../GUI
    qmake && make
}

package() {
    install -d -m755 "$pkgdir"/usr/bin
    install -m755  "$srcdir"/DownloadM/GUI/downloadm "$pkgdir"/usr/bin/

    install -d -m755 "$pkgdir"/usr/share/downloadm
    install -m644  "$srcdir"/DownloadM/GUI/downloadm.glade "$pkgdir"/usr/share/downloadm/

    install -d -m755 "$pkgdir"/usr/share/applications
    install -m755 "$srcdir"/downloadm.desktop "$pkgdir"/usr/share/applications

    install -d -m755  "$pkgdir"/usr/share/icons/hicolor/{48x48,scalable}/apps/
    install -m644 "$srcdir"/DownloadM/GUI/downloadm.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/
    install -m644 "$srcdir"/DownloadM/GUI/downloadm.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
}

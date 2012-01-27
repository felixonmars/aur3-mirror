# Maintainer: SoleSoul <j.lahav ta gmail tod com>
# Thanks for the help to: Meow < meow at linux dot cn >
pkgname=downloadm
pkgver=0.1.3
pkgrel=2
pkgdesc="A download accelerator/manager which uses aria2c as a backend."
arch=('i686' 'x86_64')
url="http://sourceforge.net/p/downloadm/"
license=('GPL')
depends=('gtkmm' 'xmlrpc-c' 'aria2' 'libsigc++')
makedepends=()
source=("http://downloads.sourceforge.net/project/downloadm/DownloadM-$pkgver.tar.gz"
		'downloadm.desktop'
		'downloadm.install')
md5sums=('e017d933a49e1af76099906117a6f3a1'
		 '4f5884af1aa22ecf9cc55dfc0445c371'
		 '7ae0d6b02dfaadf126a8388b0147b94b')
install=downloadm.install
conflicts=('downloadm')
provides=("downloadm=$pkgver")
build() {
    cd DownloadM
    
    cd aria2c_com/Release-lib
    make
    cd ../../
    
    cd DownloadM/Release-lib
    make
    cd ../../

    cd GUI-gtk2/Release
    make
    cd ../../
}

package() {
    install -d -m755 "$pkgdir"/usr/bin
    install -m755  "$srcdir"/DownloadM/GUI-gtk2/Release/downloadm "$pkgdir"/usr/bin/

    install -d -m755 "$pkgdir"/usr/share/downloadm
    install -m644  "$srcdir"/DownloadM/GUI-gtk2/downloadm.glade "$pkgdir"/usr/share/downloadm/

    install -d -m755 "$pkgdir"/usr/share/applications
    install -m755 "$srcdir"/downloadm.desktop "$pkgdir"/usr/share/applications

    install -d -m755  "$pkgdir"/usr/share/icons/hicolor/{48x48,scalable}/apps/
    install -m644 "$srcdir"/DownloadM/GUI-gtk2/downloadm.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/
    install -m644 "$srcdir"/DownloadM/GUI-gtk2/downloadm.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
}

# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>
# Maintainer: Kevin Brubeck Unhammer <unhammer@gmail.com>
pkgname=flickrkio  
pkgver=0.1
pkgrel=1 
pkgdesc="KIO slave for browsing Flickr from within KDE. Access files directly from dolphin or gwenview."
url="http://kde-apps.org/content/show.php/Flickr+KIO?content=125714"
arch=('i686', 'x86_64')
license=('GPL')
depends=('qjson' 'kdelibs>=4.0.0')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://dev.sharpley.org.uk/temp/$pkgname/${pkgname}_$pkgver.tar.gz")
md5sums=('ca1364605408f36f28ba2775914f7dc1')
build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake ../${pkgname} -DCMAKE_INSTALL_PREFIX=/usr
    make || return 1
}

package() {
    cd "$srcdir/build"
    make DESTDIR=${pkgdir} install || return 1
}

# Contributor: l1feh4ck3r <1ifeh4ck3r@gmail.com>

pkgname=koffice2-l10n-ru
_lang=ru
pkgver=1.9.98.5
pkgrel=2
pkgdesc="Russian localization for Koffice2"
arch=('i686' 'x86_64')
url="http://www.koffice.org/"
license=('GPL')
depends=('koffice2>=1.9.98.5')
makedepends=('cmake' 'automoc4')
provides=(koffice2-alpha-ru)
conflicts=(koffice2-alpha-ru)
source=(http://download.kde.org/unstable/koffice-$pkgver/src/koffice-l10n/koffice-l10n-ru-$pkgver.tar.bz2)
md5sums=('df5e6e893767cc9801c2df84dddb13a1')

build() {
        
        cd "$srcdir/koffice-l10n-ru-$pkgver"
        [ -d 'build' ] &&  rm -rf build
        mkdir build
        cd build
        cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
        make || return 1
        make DESTDIR="$pkgdir/" install || return 1
}


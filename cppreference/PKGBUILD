# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Vinicius de Avila Jorge <vinicius.avila.jorge@gmail.com>
pkgname=cppreference
pkgver=20141118
pkgrel=1
pkgdesc="A complete reference for the features in the C++ Standard Library. HTML book."
arch=('any')
url="http://en.cppreference.com/"
license=('CCPL:cc-by-sa')
options=('!strip' '!emptydirs')
changelog=Changelog
depends=('ttf-dejavu')
source=("http://upload.cppreference.com/mwiki/images/6/6c/html_book_${pkgver}.tar.gz")
sha256sums=('fdb0e880ebd65f49daf217aef4d40b398421578d82e35345650aa2ef1f86026b')

package() {
    mkdir -p "$pkgdir/usr/share/doc/cppreference"
    mv -t "$pkgdir/usr/share/doc/cppreference/" $srcdir/reference/*
    rm "$pkgdir/usr/share/doc/cppreference/common/DejaVuSansMonoCondensed60.ttf"
    rm "$pkgdir/usr/share/doc/cppreference/common/DejaVuSansMonoCondensed75.ttf"
}

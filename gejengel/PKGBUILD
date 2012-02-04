# Maintainer: Dirk Vanden Boer <dirk.vdb@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Alois Nespor <alois.nespor@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gejengel
pkgver=0.1.4
pkgrel=1
pkgdesc="An audio player which focuses on performance and simplicity"
arch=('x86_64' 'i686')
url="http://gejengel.googlecode.com/svn/trunk/web/index.html"
license=('GPL')
depends=('ffmpeg' 'taglib' 'libnotify' 'imagemagick' 'alsa-lib' 'lastfmlib' 'libmad' 'flac' 'libxdg-basedir' 'gtkmm')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('9efe0f95098fba7d046ac0d2d84b12dc')

build() {
    cd "$srcdir"/$pkgname-$pkgver
    ./configure --disable-shared --enable-silent-rules --prefix=/usr || return 1
    make || return 1
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install || return 1
}

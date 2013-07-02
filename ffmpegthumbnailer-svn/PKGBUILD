# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: boromil@gmail.com
# Contributor: Ner0

pkgname=ffmpegthumbnailer-svn
pkgver=2.0.8.248
pkgrel=1
pkgdesc="Lightweight video thumbnailer that can be used by file managers."
arch=(i686 x86_64)
url=http://code.google.com/p/${pkgname%-*}/
license=(GPL2)
depends=(ffmpeg libjpeg libpng)
makedepends=(subversion)
optdepends=('gvfs: support for gio uris')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
source=($pkgname::svn+https://${pkgname%-*}.googlecode.com/svn/trunk)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    echo $(grep AC_INIT $pkgname/configure.ac | tr -d '[a-zA-z](), ').$(svnversion "$SRCDEST"/$pkgname/)
}

prepare() {
    sed -i 's:AM_CONFIG_HEADER:AC_CONFIG_HEADERS:' $pkgname/configure.ac
}

build() {
    cd $pkgname/
    autoreconf -fi
    ./configure --prefix=/usr --enable-gio --enable-thumbnailer
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}

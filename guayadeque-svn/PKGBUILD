# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>
# Contributor: Martin Herndl <martin.herndl@gmail.com>

pkgname=guayadeque-svn
epoch=1
pkgver=0.3.5.1890
pkgrel=1
pkgdesc="Full Featured Linux media player for large collections"
arch=(i686 x86_64)
url=http://sourceforge.net/projects/${pkgname%-*}
license=(GPL3)
depends=(desktop-file-utils flac libgpod taglib wxgtk2.8 'wxsqlite3>=3.0.1')
makedepends=(cmake subversion)
optdepends=('gstreamer0.10-plugins: all Gstreamer plugins to play all kind of music files')
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
install=$pkgname.install
source=($pkgname::svn+https://${pkgname%-*}.svn.sourceforge.net/svnroot/${pkgname%-*}/Trunk)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd "$SRCDEST"/$pkgname/
    echo $(grep -m1 ID src/Version.h.in | sed 's/[^0-9.]//g').$(svnversion)
}

build() {
    cd $pkgname/
    cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DwxWidgets_wxrc_EXECUTABLE=/usr/bin/wxrc-2.8 \
        -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-2.8
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}

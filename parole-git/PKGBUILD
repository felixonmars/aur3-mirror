# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from parole package)
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: TDY <tdy@gmx.com>

pkgname=parole-git
pkgver=0.8.0.8.g770d977
pkgrel=1
pkgdesc="A modern simple media player based on the GStreamer framework"
arch=(i686 x86_64)
url=http://goodies.xfce.org/projects/applications/${pkgname%-*}
license=(GPL2)
depends=(desktop-file-utils gst-plugins-good libnotify libxfce4ui-git)
makedepends=(git xfce4-dev-tools)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
install=$pkgname.install
source=($pkgname::git://git.xfce.org/apps/${pkgname%-*})
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^parole-//;s/-/./g'
}

prepare() {
    sed -i 's:AM_CONFIG_HEADER:AC_CONFIG_HEADERS:' $pkgname/configure.ac.in
}

build() {
    cd $pkgname/
    ./autogen.sh \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --enable-taglib \
        --enable-libnotify
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
}

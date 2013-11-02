# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
#
# (Added from thunar package)
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=thunar-git
pkgver=1.6.3.69.gbb65cb5
pkgrel=1
pkgdesc="Modern file manager for Xfce"
arch=(i686 x86_64)
license=(GPL2)
url=http://thunar.xfce.org
groups=(xfce4-git)
depends=(desktop-file-utils exo-git gtk2 hicolor-icon-theme libexif libnotify libpng libxfce4ui-git
    libxfce4util-git)
makedepends=(git xfce4-dev-tools)
optdepends=('gvfs: trash support, mounting with udisk, and remote filesystems'
    'xfce4-panel-git: trash applet')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
install=$pkgname.install
source=($pkgname::git://git.xfce.org/xfce/${pkgname%-*})
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^thunar-//;s/-/./g'
}

build() {
    cd $pkgname/
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --enable-gio-unix \
        --enable-dbus \
        --enable-startup-notification \
        --enable-gudev \
        --enable-exif \
        --enable-pcre \
        --enable-gtk-doc \
        --disable-debug
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
    sed -i ':x-directory/gnome-default-handler;:d' "$pkgdir"/usr/share/applications/Thunar-folder-handler.desktop
}

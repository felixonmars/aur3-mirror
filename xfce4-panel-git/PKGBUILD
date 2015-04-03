# Maintainer: Silvio Knizek <killermoehre@gmx.net>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: lh <jarryson@gmail.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

_pkgname=xfce4-panel
pkgname="${_pkgname}-git"
pkgver=4.12.0.r12.g32dd833
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org"
groups=("xfce4")
depends=('exo' 'garcon' 'libxfce4ui' 'libwnck' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool' 'gtk-doc' 'xfce4-dev-tools' 'git')
provides=("${_pgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("git://git.xfce.org/xfce/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed -r "s/^${_pkgname}-//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --enable-gio-unix \
        --enable-gtk-doc \
        --enable-gtk3 \
        --disable-debug
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir" install
}


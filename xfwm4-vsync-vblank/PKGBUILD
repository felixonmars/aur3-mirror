# Contributor: Diego P.
# Contributor: Alessio Biancalana <dottorblaster@archlinux.us>
# Contributor: Adnrea "bash/ascarpino" Scarpino <andrea@archlinux.org>

pkgname=xfwm4-vsync-vblank
_realname=xfwm4
pkgver=4.10.0
pkgrel=2
pkgdesc="Xfce Window Manager with vsync patch"
arch=('i686' 'x86_64')
url="https://bugzilla.xfce.org/show_bug.cgi?id=8898"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'libwnck' 'hicolor-icon-theme' 'libdrm')
makedepends=('intltool')
provides=(${_realname})
conflicts=(${_realname})
options=('!libtool')
install=${_realname}.install

source=("http://archive.xfce.org/src/xfce/${_realname}/4.10/${_realname}-${pkgver}.tar.bz2"
        patch.patch::"https://bugzilla.xfce.org/attachment.cgi?id=4786")

sha256sums=('492357bf48121ebffabf2bf0d3b84213d19bf81087321175d687c8a68efe1f9c'
            'a92db1e2216cb45202f7754f2c39986963b177b23162caef97dc2fdcb89db597')

build() {
  cd ${srcdir}/${_realname}-${pkgver}

# Add vsync to compositor https://bugzilla.xfce.org/show_bug.cgi?id=8898
patch -n -p1 -i "${srcdir}"/patch.patch

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-xsync \
    --disable-debug
  make
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
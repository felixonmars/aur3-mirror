# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Tobias Kieslich <tobias (at) archlinux.org>

_pkgname=xfce4-xfapplet-plugin
pkgname=${_pkgname}-mate
pkgver=0.1.0
pkgrel=2
pkgdesc="plugin that allows to use gnome applets in the Xfce4 panel"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libxfcegui4' 'mate-panel' 'libmatecomponent' 'libmatecomponentui' 'mate-vfs')
conflicts=("${_pkgname}")
source=(http://archive.xfce.org/src/panel-plugins/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2
        mate.diff)

build() {
	cd ${srcdir}
	patch -Np0 -i ${srcdir}/mate.diff
	
    cd ${srcdir}/${_pkgname}-${pkgver}

	CFLAGS="$CFLAGS -I/usr/include/libmatecomponent-2.0"
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/ \
        --localstatedir=/var \
        --disable-static \
        --disable-debug
    make
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
md5sums=('6a06c44b18a97626f44a240ad3bc3244'
         'f7443b72a9606b85a20a23777a4cc3b7')

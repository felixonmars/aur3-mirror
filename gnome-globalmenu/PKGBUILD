# Contributor: M4rQu1Nh0S <zonadomarquinhos@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=gnome-globalmenu
pkgver=0.7.10
pkgrel=3
pkgdesc="Global Menu Bar for GNOME"
url="http://code.google.com/p/gnome2-globalmenu/"
arch=('i686' 'x86_64')
license=('GPL2' 'GPL3')
depends=('gnome-panel' 'libnotify' 'gnome-panel-bonobo' 'gnome-menus2' 'libwnck')
optdepends=()
options=('!libtool')
conflicts=('gtk2-aqd' 'gtk2-globalmenu' 'gnome-globalmenu-svn')
install=gnome-globalmenu.install
source=("http://gnome2-globalmenu.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2")
md5sums=('62d0ec181c7d7821f753591626b64d2f')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    export LDFLAGS=""
    ./configure --prefix=/usr --disable-tests --without-gnome-panel --without-xfce4-panel --sysconfdir=/etc --libexecdir=/usr/lib 
    make || return 1
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install || return 1

    install -d -m755 "${pkgdir}/usr/share/gconf/schemas"
    gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
    rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}

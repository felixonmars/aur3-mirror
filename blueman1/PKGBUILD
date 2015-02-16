# Maintainer: Martin Wimpress <code@flexion.org>

pkgname=blueman1
_pkgname=blueman
pkgver=1.23
pkgrel=1
pkgdesc="A GTK+ Bluetooth Manager (BlueZ 4)"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/blueman-project/blueman"
depends=('bluez4' 'dbus-glib' 'gtk2' 'notification-daemon'
         'libnotify' 'obex-data-server' 'python2-cairo'
         'python2-dbus' 'python2-pybluez' 'polkit' 'pyrex' 'obex-data-server' 'perl'
         'startup-notification' 'python2-notify' )
optdepends=('dnsmasq: DHCP server for Network Access Point'
            'pulseaudio: for some audio support')
makedepends=('intltool' 'libtool' 'cython2')
optdepends=('pulseaudio: for some audio support')
conflicts=('blueman-git' 'blueman-bzr' 'blueman')
source=("${_pkgname}-${pkgver}.zip"::"http://download.tuxfamily.org/blueman/blueman-${pkgver}.tar.gz")
sha256sums=('50b261bcdc2e99e176c7c194825da1259500aaacaccb92714d97af0209a4f011')
install=${_pkgname}.install

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # Replace the python interpreter with python2
    for PY in apps/blueman-*
    do
        sed -i 's/python/python2/' "${PY}"
    done
    #NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export PYTHON=/usr/bin/python2
    export CYTHONEXEC=/usr/bin/cython2
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/${_pkgname} \
        --disable-hal \
        --disable-sendto \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

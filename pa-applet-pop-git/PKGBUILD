# Maintainer: Marc MAURICE  <marc-manjaro@pub.positon.org>
# Philip Müller <philm[at]manjaro[dog]org>
# Contributor: Nicolas Avrutin  <nicolasavru@gmail.com>
pkgname=pa-applet-pop-git
pkgver=0.0.0
pkgrel=1
pkgdesc="PulseAudio system tray applet with volume bar, and pops on volume change"
arch=(i686 x86_64)
url="https://github.com/dooblem/pa-applet"
license=('BSD')
depends=('gtk3' 'libnotify' 'libpulse' 'libcanberra-pulse')
makedepends=('git')
options=('!libtool')
replaces=('pa-applet-git' 'pa-applet')
conflicts=('pa-applet-git' 'pa-applet')
install=${pkgname}.install

source=("$pkgname"::'git://github.com/dooblem/pa-applet.git' pa-applet.desktop)
sha256sums=('SKIP' '99db3caaf0abb403480b466d6b937c9a72c9fc17e86c07bbeaf9c973ce8da303')

pkgver() {
    cd "$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${srcdir}/pa-applet.desktop" "${pkgdir}/etc/xdg/autostart/pa-applet.desktop"
}

# Contributor: Giovanni Ricciardi <kar98k.sniper@gmail.com>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Piotr Gorski <sir_lucjan@openlinux.pl>

pkgname=mate-screensaver-1.7
_pkgname=mate-screensaver
pkgver=1.7.0
pkgrel=1
pkgdesc='Screensaver for MATE'
url="http://mate-desktop.org"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL')
depends=('dbus' 'desktop-file-utils' 'gtk2' 'libmatekbd' 'libnotify' 'libxss'
         'libxt' 'libxxf86vm' 'mate-desktop' 'mate-icon-theme'
         'mate-menus' 'mate-session-manager' 'pam' 'scrnsaverproto'
         'startup-notification' 'systemd')
makedepends=('mate-common' 'mate-doc-utils' 'perl-xml-parser' 'xmlto')
optdepends=('mate-power-manager: Add power management support.')
options=('!emptydirs' '!libtool')
groups=('mate')
source=(http://pub.mate-desktop.org/releases/1.7/${_pkgname}-${pkgver}.tar.xz
        mate-screensaver.pam)
sha1sums=('16f24b396ba4c1a5ef095ece7d5098ce3cc29701'
          'ed640f5875e264e7d7dfe4f20f3cc13ab8b836d1')

provides=(mate-screensaver)
conficts=(mate-screensaver)
replaces=(mate-screensaver)
install=${_pkgname}.install

build() {
    cd $srcdir/${_pkgname}-${pkgver}
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgname} \
        --sysconfdir=/etc \
        --with-xscreensaverdir=/usr/share/xscreensaver/config \
        --with-xscreensaverhackdir=/usr/lib/xscreensaver \
        --with-mit-ext \
        --with-libnotify \
        --enable-locking \
        --disable-static
    make
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
pkgname=flock-pl
pkgver=2.0.3
pkgrel=1.2
pkgdesc="Flock is a free, easy-to-use web browser built on Mozilla technologies. Localized in Polish"
url="http://www.flock.com/"
arch=('i686')
license=('MPL' 'GPL')
depends=('gtk2' 'fontconfig')
source=(http://ftp.osuosl.org/pub/flock/releases/2.0.3/l10n/pl/flock-$pkgver.pl.linux-i686.tar.bz2
        flock.desktop flockbrowser)
md5sums=('14c738e4b6203765406391d7689cd642'
         '24681cffa79f9ff59d2ee75283ad3420'
         '673bc7580f0cfa218f74aae7e8dbd347')

build() {
    cd $startdir/src/$pkgname
    mkdir -p ${startdir}/pkg/{usr/bin,opt/flock}
    cp -R * ${startdir}/pkg/opt/flock

    install -D -m755 ${startdir}/src/flockbrowser \
                       $startdir/pkg/usr/bin/flockbrowser

    install -D -m644 ${startdir}/src/$pkgname/icons/mozicon50.xpm \
                       ${startdir}/pkg/usr/share/pixmaps/flock.png

    install -D -m644 ${startdir}/src/flock.desktop \
                        ${startdir}/pkg/usr/share/applications/flock.desktop
}

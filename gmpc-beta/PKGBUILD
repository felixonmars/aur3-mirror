# Maintainer:  Jurij Podgoršek <gismopwn at gmail dot com>
# Contributor:  tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Modified: Lukas Miczka <lukascpu@gmail.com>

pkgname=gmpc-beta
pkgver=0.20.0
pkgrel=2
pkgdesc="a GNOME based GUI client tool for MPD"
arch=(i686 x86_64)
url="http://sarine.nl/gmpc"
license=("GPL")
depends=('libglade' 'libmpd-beta>=0.20.0' 'curl>=7.16.2' 'libsm')
makedepends=('gob2')
options=(!libtool)
source=(http://download.sarine.nl/Programs/gmpc/$pkgver/gmpc-${pkgver}.tar.gz)
md5sums=('902fd69b0b6bb40abb647604080dd7ef')

build() {
cd ${startdir}/src
tar xzf gmpc-${pkgver}.tar.gz
    
cd ${startdir}/src/gmpc-$pkgver
LIBS="/usr/lib/libX11.so.6 /usr/lib/libz.so.1" ./configure --prefix=/usr
make || return 1
sed -i 's|GNOME;Application;AudioVideo;|GTK;Application;AudioVideo;Player;|' \
data/gmpc.desktop
make DESTDIR=${startdir}/pkg install
}


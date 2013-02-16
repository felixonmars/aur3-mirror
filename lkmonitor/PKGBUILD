# Contributor: Jack <nim901@gmail.com>
# Maintainer: M Rawash <mrawash@gmail.com>
# Contributor: DonVla <donvla<at>users<dot>sourceforge<dot>net>

pkgname=lkmonitor
pkgver=0.3
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="A gtk tool for monitoring and managing the linux kernel."
license=('GPL')
depends=('libgnomeui')
options=(!docs)
url="http://lkmonitor.sourceforge.net"
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('dd84ee3952fc03ee8319658dc3866e3c')
sha256sums=('ab2fd454a53a73e9afb3c87a5496fa33e8a95b5cc0fe29e773ddf9e4d7c587a2')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # fix desktop file
    sed -i 's/DIR@\//DIR@\/lkmonitor-icon.png/' lkmonitor.desktop.in
    echo "Categories=System;Utility;GTK;" >> lkmonitor.desktop.in
     
    LDFLAGS="-lX11" ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR=${pkgdir} \
    gnomemenudir=/usr/share/applications  \
    lkmonitordocdir=/usr/share/doc/lkmonitor install
}

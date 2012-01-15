# Maintainer: IgnorantGuru  http://igurublog.wordpress.com/contact-ignorantguru/
# The AUR pcmanfm-mod package does not provide pcmanfm and can thus be
# installed concurrently with other versions of pcmanfm.
# The AUR pcmanfm-mod-prov package provides pcmanfm and thus conflicts
# with other versions of pcmanfm.
# The AUR pcmanfm-mod-nohal package is built without hal dependency - this
# version has no built-in volume management support.
pkgname=pcmanfm-mod-nohal
pkgver=1.2.4
pkgrel=1
pkgdesc="A modified version of the legacy PCMan File Manager v0.5.2 - no hal support"
arch=('i686' 'x86_64')
url=("http://igurublog.wordpress.com/downloads/mod-pcmanfm/")
license=('GPL2')
depends=('gtk2' 'gamin' 'shared-mime-info' 'desktop-file-utils' 'startup-notification')
optdepends=('fam: alternative to gamin' 'gksu: perform as root functionality' 'gnome-icon-theme')
makedepends=('intltool' 'gettext')
provides=('pcmanfm-mod')
conflicts=('pcmanfm-mod' 'pcmanfm-mod-prov')
install=pcmanfm-mod.install
source=("http://downloads.sourceforge.net/project/pcmanfm-mod/pcmanfm-mod-$pkgver.tar.xz")
md5sums=('db72023f66adc18bb6c0b07f0f346d9d')
sha256sums=('19a07615e9051ee598a8a7d9088ec139868ffeccb92fb087cbff97678e6ebb8e')

build() {
    cd "$srcdir/pcmanfm-mod-$pkgver"
    # NOTE: To change su program from default ktsuss, add for example
    #       --with-preferable-sudo=gksudo to configure line below.
    ./configure --disable-hal --prefix=/usr
    make || return 1
    make DESTDIR=$pkgdir install || return 1
    install -Dm755 "$srcdir/pcmanfm-mod-$pkgver/pcmanfm-opener" "$pkgdir/usr/bin/pcmanfm-opener"
}


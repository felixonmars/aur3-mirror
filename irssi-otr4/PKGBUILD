# Maintainer: Christian Babeux <christian.babeux@0x80.ca>

pkgname=irssi-otr4
pkgver=1.0.0
pkgrel=1
pkgdesc="Off-the-Record Messaging (OTR) for the Irssi IRC client"
arch=('i686' 'x86_64')
url="https://github.com/cryptodotis/irssi-otr"
license=('GPL2')
depends=('libotr>=4.0.0' 'irssi>=0.8.15' 'libgcrypt>=1.5.0' 'glib2')
source=("https://github.com/cryptodotis/irssi-otr/archive/v$pkgver.tar.gz")
sha1sums=('1a981b96317778cdf72c0d2a8b08c44f72d808e5')

build()
{
    cd "irssi-otr-${pkgver}"
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    cd "irssi-otr-${pkgver}"
    make install DESTDIR=${pkgdir}
}

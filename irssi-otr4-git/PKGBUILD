# Maintainer: Christian Babeux <christian.babeux@0x80.ca>

pkgname=irssi-otr4-git
_gitname="irssi-otr"
pkgver=v1.0.0.alpha1.13.g59ddcbe
pkgrel=1
pkgdesc="Off-the-Record Messaging (OTR) for the Irssi IRC client"
arch=('i686' 'x86_64')
url="https://github.com/cryptodotis/irssi-otr"
license=('GPL2')
depends=('libotr>=4.0.0' 'irssi>=0.8.15' 'libgcrypt>=1.5.0' 'glib2')
source=('git://github.com/cryptodotis/irssi-otr.git')
sha1sums=('SKIP')

pkgver()
{
    cd ${_gitname}
    git describe --always | sed 's|-|.|g'
}

build()
{
    cd ${_gitname}
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    cd ${_gitname}
    make install DESTDIR=${pkgdir}
}
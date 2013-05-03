# Maintainer: Chirantan Ekbote <chirantan.ekbote@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=libwiimote
pkgver=0.4
pkgrel=3
pkgdesc="C library for communicating with a Wii Remote."
arch=('i686' 'x86_64')
url="http://libwiimote.sourceforge.net"
license=('GPL')
depends=('bluez-libs')
makedepends=('autoconf' 'automake')
changelog=CHANGELOG
source=(http://downloads.sf.net/$pkgname/$pkgname-$pkgver.tgz \
    libwiimote-0.4-bluez4.patch \
    libwiimote-0.4-dso-symlinks.patch \
    libwiimote-0.4-fpic.patch \
    libwiimote-0.4-includedir.patch \
    libwiimote-0.4-soname.patch)
md5sums=('0d8d61dc989d8ad83e1005a26136d388'
    '5717f661a19bdf7b0ee4bcc55780da92'
    '1696627d579d2b01c8966237ddbca10a'
    'fdbb8e7f6a14176008b07d3782b803c1'
    '0119fd21080e09d273aece87d08ebd43'
    '1d8f60a6ffab70404e1a4c34668de4fb')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    msg2 "Applying patches..."
    # patches from Fedora:
    # http://cvs.fedoraproject.org/viewvc/rpms/libwiimote/F-11/
    patch -Np1 -i ../libwiimote-0.4-bluez4.patch
    patch -Np1 -i ../libwiimote-0.4-dso-symlinks.patch
    patch -Np1 -i ../libwiimote-0.4-fpic.patch
    patch -Np1 -i ../libwiimote-0.4-includedir.patch
    patch -Np1 -i ../libwiimote-0.4-soname.patch
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    autoreconf --install
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

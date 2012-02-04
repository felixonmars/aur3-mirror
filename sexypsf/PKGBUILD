# Contributor: quantax -- contact via Arch Linux forum or AUR
# Contributor: rabyte <rabyte*gmail>

pkgname=sexypsf
pkgver=0.4.8
pkgrel=2
pkgdesc="A PlayStation/Portable Sound Format (PSF1) player and XMMS plugin."
arch=('i686' 'x86_64')
url="http://projects.raphnet.net/#sexypsf"
license=('GPL')
makedepends=(xmms)
optdepends=('xmms: for the XMMS plugin')
source=(http://projects.raphnet.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('38fc637bd044008d0f75b902b1ad0101')

build() {
    cd "$srcdir/$pkgname-$pkgver/Linux"

    make || return 1
    cd ..
    make || return 1

    install -m755 -D Linux/sexypsf "$pkgdir/usr/bin/sexypsf"
    install -m755 -D libsexypsf.so "$pkgdir/usr/lib/xmms/Input/libsexypsf.so"
}


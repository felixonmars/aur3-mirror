# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgname=mono-nat
pkgver=1.1.0
pkgrel=1
pkgdesc="C Sharp library which allows you to easily forward ports on any uPnP capable router"
arch=('any')
url="http://projects.qnetp.net/projects/show/mono-nat"
license=('MIT')
depends=('mono')
options=('!emptydirs')
source=(http://projects.qnetp.net/attachments/download/76/$pkgname-$pkgver.tar.gz
        LICENSE)
md5sums=('4985a00fe1915bac95ad330944185583'
         '7309ae32efe6718f472aeed3c3f456e9')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install

    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

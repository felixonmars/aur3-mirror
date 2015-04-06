# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=codeslayer
pkgver=4.3.1
pkgrel=1
pkgdesc="A source code editor that boasts a clean interface but powerful features."
arch=(i686 x86_64)
url=http://code.google.com/p/$pkgname/
license=(GPL2)
depends=(desktop-file-utils gtksourceview3)
makedepends=(git gtk-doc intltool)
install=$pkgname.install
source=(git+https://code.google.com/p/codeslayer/#tag=v$pkgver
        $pkgname.desktop)
options=(!buildflags !libtool)
sha256sums=('SKIP'
            '5d8b46ba9a71492766bcb6c908a7030bbb22b73e2743f5c2412f0a9ba15e0348')
sha512sums=('SKIP'
            'bcc72aa995aa46a958590a0525ea54f88ede1aa71c93ea138b18119b790286cb84ee832a69f50a4f6fb7bc23d6ab659f69b3d5cf5e60635c4e8655bcadc09293')

build() {
    cd $pkgname/
    autoreconf -fi
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
}

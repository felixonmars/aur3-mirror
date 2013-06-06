# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Maintainer: Siôn Le Roux <sinisterstuf@gmail.com>

pkgname=tomboy-reminder
pkgver=0.9.2
pkgrel=1
pkgdesc="A tomboy plugin to tell Tomboy to pop up a note when you want to be reminded"
url="http://flukkost.nu/blog/tomboy-reminder/"
depends=('tomboy')
arch=(any)
license=(Apache)
source=("http://flukkost.nu/tomboy-reminder-0.9.2.tar.gz")
md5sums=('a253761c7fe85a7043409202d0bdda50')
patches=('Reminder.addin.xml.patch')

prepare() {
    # bump the version number in Reminder.addin.xml (patch sent to owner too)
    patch -p1 -d "$srcdir/$pkgname-$pkgver" < "$startdir/$patches"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

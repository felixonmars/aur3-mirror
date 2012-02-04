# Contributor: corvolino <corvolino@archlinux.com.br>

pkgname=lunar-applet
pkgver=2.0
pkgrel=3
pkgdesc="A drop-in replacement of gnome clock applet with Chinese lunar calendar support."
arch=("i686" "x86_64")
url="http://code.google.com/p/lunar-applet/"
license=('GPL2')
depends=("gnome-panel" "liblunar")
source=("http://lunar-applet.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('0ae9026b15e70976a0d3462e906c5672')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        ./configure --prefix=/usr --libexecdir=/usr/lib/${pkgname} --sysconfdir=/etc
        make || return 1
        make DESTDIR=$pkgdir install
}



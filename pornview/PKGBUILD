# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=pornview
pkgver=0.2.0pre1
pkgrel=3
pkgdesc="A lightweight image viewer."
url="http://sourceforge.net/projects/pornview"
arch=('i686' 'x86_64')
license=('GPL')
#depends=('gdk-pixbuf')
source=("http://ftp.debian.org/debian/pool/main/p/$pkgname/${pkgname}_${pkgver/.0}.orig.tar.gz"
        "$pkgname-${pkgver/pre/_pre}-new-gtk-object-system.diff::http://bugs.gentoo.org/attachment.cgi?id=185914")
md5sums=('339fde6d7ff0cc1053abe951601373e6'
         '886952d6fe1b792f57d0b6256714e6a0')

build() {
 cd "$srcdir/$pkgname-$pkgver"
 patch -p1 < "$srcdir/$pkgname-${pkgver/pre/_pre}-new-gtk-object-system.diff"
 ./configure --prefix=/usr --with-gtk2
 make
}

package() {
 cd "$srcdir/$pkgname-$pkgver"
 make DESTDIR="$pkgdir" install
}

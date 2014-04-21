# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: juergen <juergen@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Yu-Fu Wu <wennynnewenny@gmail.com>

pkgname=scheme48
pkgver=1.9.2
pkgrel=0
pkgdesc="Scheme 48 is an implementation of Scheme"
arch=('i686' 'x86_64')

license=(BSD)

depends=('glibc')
provides=('scheme48')
conflicts=('scheme48')

source=("http://www.s48.org/$pkgver/scheme48-$pkgver.tgz")
md5sums=('7a869c794ca7f67ea69e98a4f2fbd7b2')


url="http://www.s48.org/"
noextract=("$pkgname-$pkgver.tgz")

 
build() {
  tar -xvf $srcdir/$pkgname-$pkgver.tgz
  cd $srcdir/$pkgname-$pkgver
  # patch -p1 -i "$srcdir/makefile.patch" || return 1
  ./configure --prefix=/usr
  make

}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install-no-doc 
  install -Dm644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
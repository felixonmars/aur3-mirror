# Maintainer: Chris Brannon <chris@the-brannons.com>
# Contributor: Jose Negron <josenj.arch@mailnull.com>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Sergej Chodarev <sergejx@centrum.sk>

pkgname=sitecopy
pkgver=0.16.6
pkgrel=4
pkgdesc="Synchronize local and remote web site via FTP or WebDAV"
arch=("i686" "x86_64")
url="http://www.manyfish.co.uk/sitecopy/"
license=('GPL')
depends=('libxml2' 'zlib' 'neon>=0.25.4' 'expat>=2.0.0' 'openssl')
source=(http://www.manyfish.co.uk/sitecopy/$pkgname-$pkgver.tar.gz $pkgname.patch
        ssl.patch)
md5sums=('b3aeb5a5f00af3db90b408e8c32a6c01'
         '5a7e16b3f9b9bc12258e55be3666c667'
         'b76bcc54705a68c7d320c4ef8fab721c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/$pkgname.patch"
  patch -p1 -i "$srcdir/ssl.patch"
  ./configure --prefix=/usr --with-ssl=openssl
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:

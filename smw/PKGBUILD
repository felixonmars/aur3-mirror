# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=smw
pkgver=1.7.afe
pkgrel=3
pkgdesc="A Super Mario multiplayer game"
arch=('i686' 'x86_64')
url="http://smw.72dpiarmy.com/"
license=('GPL2')
depends=('gcc-libs' 'sdl_mixer' 'sdl_image' 'desktop-file-utils')
makedepends=('bin86')
install=smw.install
source=(http://www.fileden.com/files/2007/9/11/1425938/$pkgname-1.7afe-src.zip
        $pkgname.desktop
        $pkgname.png
        gcc43.patch)
md5sums=('9dff7aa6d1ec9e3b08e4b8a75932dd1f'
         '78b87b9c99c232ecc9f659a4994da12b'
         'b7f5ef181e41eb0339be746ea03ff628'
         '741167ac89de09fb362b5efd98069cd1')

build() {
  cd "$srcdir/${pkgname}1.7afe"

  patch -p1 -i "$srcdir/gcc43.patch" || return 1
  sed -i 's/\r//g' configure

  ./configure
  make || return 1
  make DESTDIR="$pkgdir" install

  # Set sane permissions
  find "$pkgdir/usr/share/$pkgname" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/$pkgname" -type f -exec chmod 644 {} \;

  # Install application shortcut and icon
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

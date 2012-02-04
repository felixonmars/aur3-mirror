# Contributor: tobias <tobias@archlinux.org>
# Contributor: twm
# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=mrxvt
pkgver=0.5.4
pkgrel=5
pkgdesc="A multi-tabbed X terminal emulator based on rxvt code (also known as materm)"
arch=('i686' 'x86_64')
url="http://materm.sourceforge.net"
license=('GPL')
depends=('libpng' 'libjpeg' 'libxft' 'libxpm')
optdepends=('perl: for mrxvtset.pl script')
replaces=('materm')
backup=('etc/mrxvt/mrxvtrc' 'etc/mrxvt/submenus.menu' 'etc/mrxvt/default.menu')
source=("http://downloads.sourceforge.net/materm/$pkgname-$pkgver.tar.gz"
        'mrxvt-0.5.4-001-fix-segfault-when-wd-empty.patch'
        'mrxvt.desktop' 
        'libpng14.patch')
md5sums=('0232c8868484751dcb931a28f0756f69'
         '2b6ecc9d68185e56a50eca0a2548fa8b'
         '3dcb8e404e6324d7768b43fe6a7986c4'
         '3465d6b86d550e9aa868a918d2e4e3f2')

build() {
 cd "$srcdir/$pkgname-$pkgver"
 patch -p0 < "$srcdir/mrxvt-0.5.4-001-fix-segfault-when-wd-empty.patch"
 patch -Np1 -i "$srcdir/libpng14.patch"
 autoreconf -fi
 ./configure --prefix=/usr --sysconfdir=/etc --enable-xft --enable-text-shadow \
   --enable-transparency --enable-smart-resize --enable-menubar \
   --disable-ourstrings --enable-linespace --enable-256colors --enable-xim \
   --enable-thai --enable-greek --enable-cjk --enable-backspace-key \
   --with-save-lines=2048
 make
}

package() {
 cd "$srcdir/$pkgname-$pkgver"
 make DESTDIR="$pkgdir" install
 install -Dm 644 "$srcdir/mrxvt.desktop" "$pkgdir/usr/share/applications/mrxvt.desktop"
}

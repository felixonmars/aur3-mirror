# Contributor: SaThaRiel <sathariel74[at]gmail[dot]com>
pkgname=tinyangband
pkgver=0.0.3a
pkgrel=4
pkgdesc="TinyAngband a *band variant where you can win in a short time. Go down to level 27 and kill Morgoth, Lord of Darkness as quickly as possible."
arch=('i686' 'x86_64')
url="http://xangband.sourceforge.jp/tiny/eng.html"
license=('custom')
depends=('ncurses' 'libx11')
source=(http://xangband.sourceforge.jp/tiny/$pkgname-$pkgver.tar.gz)
md5sums=('ad0770926ded0ab6a4da7e0b06733508')

build() {
  cd $srcdir/$pkgname-0.0.3
  ./configure \
    --prefix=/usr \
    --with-libpath=/usr/lib/$pkgname/ \
    --with-setgid=games \
    --disable-japanese \
    --disable-xim \
    --disable-fontset \
    --disable-sdl_mixer \
    --disable-gtk || return 1
  make || return 1
  make DESTDIR=$pkgdir/ install
  find $pkgdir/usr/lib/$pkgname -name delete.me -exec rm {} \;
}

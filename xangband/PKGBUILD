# Contributor: SaThaRiel <sathariel74[at]gmail[dot]com>
pkgname=xangband
pkgver=1.3.1
pkgrel=3
pkgdesc="XAngband is a Zangband variant of somewhat relaxed difficulty."
arch=('i686' 'x86_64')
url="http://xangband.sourceforge.jp/eng.html"
license=('custom')
depends=('ncurses' 'libx11')
source=(http://keihanna.dl.sourceforge.jp/xangband/38015/$pkgname-$pkgver.tar.gz)
md5sums=('13344563f106ddc3ba38cc10f1efeb34')

build() {
  cd $srcdir/$pkgname-$pkgver
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

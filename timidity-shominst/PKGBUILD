# Contributor: rabyte <rabyte__gmail>

pkgname=timidity-shominst
pkgver=0409
pkgrel=2
pkgdesc="Shom's collection of instrument patches for TiMidity"
arch=('i686' 'x86_64')
url="http://www.i.h.kyoto-u.ac.jp/~shom/timidity/"
license=('unknown')
depends=('timidity++')
makedepends=('unzip')
install=$pkgname.install
source=(http://www.i.h.kyoto-u.ac.jp/~shom/timidity/shominst/shominst-$pkgver.zip \
	timidity-shominst.cfg)
md5sums=('983e7f802644f681e1ac3243431de2c4' '04191f9bae7eb3c76bf14530cbe20876')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/{usr/share/timidity,etc/timidity++}/shominst
  mv timidity-shominst.cfg $startdir/pkg/etc/timidity++
  rm timidity.cfg
  sed -i 's|mt32.cfg|/etc/timidity++/shominst/mt32.cfg|g' sfx.cfg
  install -m644 *.cfg $startdir/pkg/etc/timidity++/shominst
  cp -r inst/* $startdir/pkg/usr/share/timidity/shominst
}

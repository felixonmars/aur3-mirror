# Contributor:  Leslie P. Polzer <polzer@stardawn.org>
pkgname=legasynth
pkgver=0.4.1
pkgrel=1
pkgdesc="Legacy synthesizer (e.g. MOS SID) emulator"
url="http://sourceforge.net/projects/cheesetronic/"
license="GPL"
arch=('i686')
depends=(gtkmm1 alsa-lib)
source=(http://dl.sourceforge.net/sourceforge/cheesetronic/$pkgname-$pkgver.tar.gz \
    gcc4.patch)

md5sums=('14b394626aa70495d4b18146d63c4455'
         '152cdea846ef55ca42a07c8dc6d5a7cc')
sha1sums=('42fb04063f00f2191d38eec567c7a72117303d0b'
          '95d0566b01d661034d3c929b627d127cb9c10559')

build() {
  cd $startdir/src/$pkgname-$pkgver

  patch -Np1 < $startdir/gcc4.patch

  rm -f INSTALL

  automake -a ; autoconf

  ./configure --prefix=/usr

  automake -a ; autoconf

  #automake -a && autoconf

  make || return 1
  make DESTDIR=$startdir/pkg install

  find $startdir/pkg -name "*.la" -exec rm -f '{}' \;
}

# Maintainer: TDY <tdy@archlinux.info>

pkgname=ripdvd
pkgver=2.0.8
pkgrel=1
pkgdesc="A simple console utility for converting DVD movies to AVI files"
arch=('i686' 'x86_64')
url="http://ripdvd.sourceforge.net/"
license=('GPL')
depends=('bash' 'lsdvd' 'mplayer')
optdepends=('libdvdcss' 'pv' 'transcode')
source=(http://downloads.sourceforge.net/ripdvd/ripdvd-$pkgver.tar.gz)
md5sums=('341015f7e3815ddeec738461363119fa')

build() {
  cd "$srcdir/ripdvd-$pkgver"
  sed -e '/bash_/ s/755/644/; /ln -s/ d; s/mkdir -p/install -dm755/' \
      -e 's/AUTH.*TODO$/AUTHORS README README.fr/' -i install.sh
  sed -i '/^Name/ s/dvd/DVD/; /^Enc/ c\Version=1.0' desktop/ripdvd.desktop
}

package() {
  cd "$srcdir/ripdvd-$pkgver"
  ./install.sh DESTDIR="$pkgdir" \
       --prefix=/usr \
       --mandir=/usr/share/man/man1 \
       --icondir=/usr/share/pixmaps \
       --docdir=/usr/share/doc/ripdvd
  ln -sf ripdvd.1.gz "$pkgdir/usr/share/man/man1/xripdvd.1.gz"
}

# vim:set ts=2 sw=2 et:

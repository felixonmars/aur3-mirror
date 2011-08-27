# Contributor: Lukas Schaper <lukas86@gmx.net>
pkgname=soundgonverter
pkgver=0.0.1
pkgrel=1
pkgdesc="A tool to convert various music formats into another. Currently supported are MP3, WAVE, OGG, FLAC. It's written in GTK# and a front-end for ffmpeg."
arch=('i686')
url="http://sourceforge.net/projects/soundgonverter/"
license=('GPL')
depends=('ffmpeg' 'gtk-sharp-2>=2.12.1')
makedepends=('gtk-sharp-2>=2.12.1')
source=("http://downloads.sourceforge.net/sourceforge/soundgonverter/$pkgname-$pkgver.tar.gz")
md5sums=('26d53008758d37c5aa77bbe1c32d5e5c') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

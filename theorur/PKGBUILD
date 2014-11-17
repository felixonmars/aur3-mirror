# Maintainer: Igor Isaias Banlian <igorisaiasbanlian[at]gmail[dot]com>
# Contributor: Farid Abdelnour <farid[at]atelier-labs[dot]org>

pkgname=theorur
pkgver=0.5.4
pkgrel=3
pkgdesc="A GUI for Ogg/Theora streaming (Icecast2 system), written using GTK2."
url="http://theorur.tvlivre.org/"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('ffmpeg2theora' 'oggfwd' 'dvgrab' 'gtk2')
source=("http://theorur.tvlivre.org/$pkgname-$pkgver.tar.gz")
md5sums=('dab14f37cfe7726f93388b8fa740e958')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}


# Contributor: Claudio Riva <firetux83@gmail.com>

pkgname=songs
pkgver=2.14
pkgrel=1
pkgdesc="A software suite that allows a user to create beautiful songbooks using LaTeX"
arch=('any')
url="http://songs.sourceforge.net/"
license=('GPL')
depends=('texlive-bin' 'texlive-core')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/Unix%20source/$pkgname-$pkgver.tar.gz)
install=songs.install
md5sums=('ac235dff8a1c33ce2b189cf9fcf889a6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  ./configure --prefix=/usr \
        --with-texmf-path=/usr/share/texmf
  make || return 1
  make DESTDIR="$pkgdir/" install
}

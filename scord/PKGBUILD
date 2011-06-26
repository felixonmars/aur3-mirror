# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
pkgname=scord
pkgver=1.1.2
pkgrel=3
pkgdesc="FUSE filesystem to reduce disk space in SVN working copies."
arch=('i686' 'x86_64')
url="http://scord.sourceforge.net/"
license=('MIT')
depends=('fuse>=2.5' 'subversion>=0.7' 'subversion<1.7')
source=(http://tenet.dl.sourceforge.net/project/scord/scord/1.1.2/scord-1.1.2.tar.gz)
md5sums=(e52fa59ea189837b065ef2d5a26ded36) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

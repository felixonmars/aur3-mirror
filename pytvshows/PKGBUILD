# Contributor: Luiz Ribeiro <luizribeiro@gmail.com>

pkgname=pytvshows
pkgver=0.2
pkgrel=2
pkgdesc="A simple, shell based tvrss.net torrent downloader."
arch=('i686' 'x86_64')
url="http://pytvshows.sourceforge.net/"
license=('GPL')
depends=('python' 'python-feedparser')
install=
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('7cde26472ddee8b82f07966d019a7e2b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname $startdir/pkg/usr/bin/$pkgname || return 1
}

# vim:set ts=2 sw=2 et:

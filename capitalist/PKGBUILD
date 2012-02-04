
# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=capitalist
pkgver=0.3.1
pkgrel=2
pkgdesc="A Monopoly-like board game for 2-8 players.  This is the 'server' component."
arch=("i686" "x86_64")
url="http://kapitalist.sourceforge.net/"
license=("GPL")
depends=("gcc-libs")
optdepends=("${realname}: The 'client' component")
options=(!emptydirs)
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('f93ee3ce9d29eba657e087762d8fd663')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}


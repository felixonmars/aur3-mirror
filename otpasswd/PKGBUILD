# Maintainer: Nico Suarez <nicodoggie@gmail.com>
pkgname=otpasswd
pkgver=0.8
pkgrel=3
pkgdesc="A Pluggable Authentication Module (PAM) implementing GSC's Perfect Paper Passwords"
arch=('i686' 'x86_64')
url="http://otpasswd.thera.be/"
license=('GPL3')
depends=('pam' 'gettext')
makedepends=('cmake')
backup=('etc/otpasswd/otpasswd.conf')
source=("http://savannah.spinellicreations.com/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('ec2ed759a2bf6ba8c00536165048d135f1ddd4d08405caf60bc7443099e8ef31')

build(){
  cd "$srcdir/$pkgname-$pkgver/"
  cmake . && make
}

package(){
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir/" install
}

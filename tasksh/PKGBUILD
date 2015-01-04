# Contributor: Christian Kampka <christian@kampka.net>

pkgname=tasksh
pkgver=1.0.0
pkgrel=1
pkgdesc="A shell command that wraps Taskwarrior commands."
arch=('i686' 'x86_64')
url="http://tasktools.org/projects/tasksh.html"
license=('MIT')
depends=('task' 'readline')
makedepends=('cmake')
source=(http://www.taskwarrior.org/download/$pkgname-$pkgver.tar.gz)
sha256sums=('9accc81f5ae3a985e33be728d56aba0401889d21f856cd94734d73c221bf8652')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/tasksh/LICENSE"
}

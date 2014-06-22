# Maintainer: Augusto Roccasalva <augusto@rioplomo.com.ar>

pkgname=fanout
pkgver=r69.289a9ba
pkgrel=2
pkgdesc="A simple pubsub message server"
arch=('i686', 'x86_64')
url="https://github.com/travisghansen/fanout"
license=('MIT')
depends=('glibc')
makedepends=('git')
conflicts=()
provides=('fanout')
install=fanout.install

source=("$pkgname"::"git+$url"
        fanout.service
        fanout.conf.d)
sha256sums=('SKIP'
            '168692bdd85f072daad7324654342f853d9ec29d06bc5839f36bb1fcf6ee5445'
            'f3a656bc8a4462e90483eabcbe0924202fcead37a50415fe66cae9f01517b46f')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd $srcdir
  install -Dm644 fanout.service "$pkgdir"/usr/lib/systemd/system/fanout.service
  install -Dm644 fanout.conf.d "$pkgdir"/etc/conf.d/fanout
  install -Dm644 $pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -dm755 "$pkgdir"/var/log/fanout
  install -Dm755 $pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname
}

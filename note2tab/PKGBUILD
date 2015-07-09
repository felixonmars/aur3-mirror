pkgname=note2tab
pkgver=0.1.1
pkgrel=1
pkgdesc="A command line tool that translates notes into guitar tablature notation."
arch=('i686' 'x86_64')
url="http://nic-nac-project.org/~mk/projects/note2tab.html"
license=('BSD')
depends=('glibc')
source=(http://nic-nac-project.org/~mk/download/$pkgname-$pkgver.tgz)
sha1sums=('b57df349e4760feca65c405af26a159677b26bc2')

build() {
  cd "$pkgname-$pkgver"
  make

  sed -n '/Copyright/,/SUCH DAMAGE/p' note2tab.c > LICENSE && \
    sed -i 's/^ \* //;s/^ \*//' LICENSE
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 note2tab "$pkgdir/usr/bin/note2tab"
  install -Dm644 note2tab.1 "$pkgdir/usr/share/man/man1/note2tab.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

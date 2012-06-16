# Maintainer: david.runge <david[d]runge[a]frqrec[d]com>
pkgname=pidgin-safely
pkgver=1.0
pkgrel=3
pkgdesc="Checks pidgin settings with md5sums, backs up/ restores them."
arch=(any)
url="https://github.com/davezerave/pidgin-safely"
license=('GPL')
depends=('pidgin' 'sed')
backup=('etc/conf.d/pidgin-safely.conf')
install=${pkgname}.install
source=('pidgin-safely'
        'pidgin-safely.conf'
        'pidgin-safely.desktop'
        'makefile')
md5sums=('071c92081f4a0428427f640bc85a5d82'
         'a473934b6f53ddd024b4ed9a4197e75f'
         'abe09799d7a518abe444273df21540b9'
         '32134fe65f0e5577ce61526806309345')
package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

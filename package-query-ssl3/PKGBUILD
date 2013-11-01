# Contributor: tuxce <tuxce.net@gmail.com>
pkgname=package-query-ssl3
pkgver=1.2
pkgrel=2
pkgdesc="Query ALPM and AUR - with patch to use SSL-version-3"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h')
url="http://gitweb.archlinux.fr/package-query.git/"
license=('GPL')
depends=('pacman>=4.1' 'pacman<4.2' curl 'yajl>=2.0')
provides=('package-query')
conflicts=('package-query')
source=("http://mir.archlinux.fr/~tuxce/releases/package-query/package-query-$pkgver.tar.gz"
	"ssl3.patch")

build() {
  cd "$srcdir/package-query-$pkgver"
  patch -p1 -i $srcdir/ssl3.patch	# By mhsekhavat <sekhavat17@gmail.com>
  ./configure --localstatedir=/var --prefix=/usr --sysconfdir=/etc --with-aur-url=https://aur.archlinux.org
  make
}

package ()
{
  cd "$srcdir/package-query-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

md5sums=('270f1743e8b78a99cb4cc99057aec091'
         'c8d89a783fc2ecb2729bae24199c031c')

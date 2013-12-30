# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Giovanni Scafora <linuxmania@gmail.com>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=macutils
pkgver=2.0b3
pkgrel=4
pkgdesc="A collection of utilities to handle Macintosh files/archives"
arch=('i686' 'x86_64')
url="http://homepages.cwi.nl/~dik/english/ftp.html"
license=('GPL' 'custom')
depends=('glibc')
source=(http://ftp.debian.org/debian/pool/main/m/macutils/macutils_$pkgver.orig.tar.gz \
	macutils-gcc4.patch \
	LICENSE)
md5sums=('4ff71b1634ea503398c33994458fbe40'
         '2333ae576ccfcf83bf76b91c52b153ec'
         'efd4153e79835f9aa88b9480d117c47d')

build() {
  cd "$srcdir"/"$pkgname"
  patch -Np1 -i ../macutils-gcc4.patch || return 1
  make CF="${CFLAGS} -DTYPES_H -DDIRENT_H -DTERMIOS_H -DLATIN1" || return 1
}
package() {
  cd "$srcdir"/"$pkgname"
  mkdir -p "$pkgdir"/usr/{bin,share/man/man1}
  make BINDIR="$pkgdir"/usr/bin install
  install -m644 man/* "$pkgdir"/usr/share/man/man1/
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

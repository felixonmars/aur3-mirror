# Maintainer:  Andrzej Zadrożny <azadrozny@gmail.com>

pkgname=duplicati
pkgver=1.3.4
pkgrel=2
pkgdesc='Free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers. Duplicati is open source software, written in mono and available for Windows, Linux, and Mac OS X.'
arch=('i686' 'x86_64')
url="http://code.google.com/p/duplicati/"
license=('LPL')
depends=('mono')
optdepends=(
)
source=("http://duplicati.googlecode.com/files/Duplicati%20$pkgver.tgz"
    )

#build() {
#	cd "$srcdir/Duplicati"
#	install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
#	#cp -r share "$pkgdir/usr/"
#}

sha1sums=('60b2ed7d060fe18a72e50c26cb1509714405776d'
    )

package() {
  #cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/opt"
  cp -r "$srcdir/usr" "$pkgdir/usr/"
}

# Maitainer: wenLiangcan <boxeed@gmail.com>

pkgname=gister
pkgver=2.1.1
pkgrel=2
pkgdesc="gister is a command line tool for managing GitHub gists."
arch=('x86_64' 'i686')
url="https://github.com/weakish/gister"
license=('Apache v2')
depends=('curl'
         'git'
		 'codesearch'
		 'jq'
		 'gist'
		 'xclip')
conflicts=('xsel')
source=("https://github.com/weakish/gister/archive/v$pkgver.tar.gz")
md5sums=('a80757fb05f0121b477faf0f17c69e32')

package() {
		cd "$srcdir/$pkgname-$pkgver"
		install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
		install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
		install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

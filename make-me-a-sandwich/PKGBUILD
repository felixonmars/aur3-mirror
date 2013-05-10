pkgname=make-me-a-sandwich
pkgver=0.1.0
pkgrel=1
pkgdesc="make me a sandwich"
arch=('i686' 'x86_64')
url="http://www.dartlang.org/docs/sdk/"
license=('BSD')
depends=('python' 'wget')
optdepends=()
makedepends=()
provides=()
conflicts=()
replaces=()
source=("https://raw.github.com/beatgammit/make-me-a-sandwich/master/make-me-a-sandwich")
noextract=(${source[@]##*/})
md5sums=(e2ba5290032a0360acde775c74f4b603)

package(){
	install -Dm755 ${srcdir}/make-me-a-sandwich "$pkgdir/usr/bin/make-me-a-sandwich"
}

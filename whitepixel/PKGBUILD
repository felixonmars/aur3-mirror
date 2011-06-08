# Contributor:Roel Blaauwgeers <roel@theworldstate.nl>

pkgname=whitepixel
pkgver=2
pkgrel=1
pkgdesc="GPU-accelerated password hash auditing software for AMD/ATI graphics cards."
arch=('i686' 'x86_64')
url="http://whitepixel.zorinaq.com/"
license=('GPLv3')
depends=('catalyst-utils>=10.11' 'amdstream>=2.2')
optdepends=('catalyst>=10.11' 'catalyst-deamon>=10.11')
source=(http://whitepixel.zorinaq.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=(594f49b70a5e4f7d85c4305aa01458f1)

build() {
	  cd "$srcdir/$pkgname-$pkgver"

	  sed -i 's/\/usr\/local\/ati-stream\//\/opt\/amdstream\//g' Makefile
	  make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin" 
	cp whitepixel "$pkgdir/usr/bin"
}

# Maintainer: Kevin Cox <kevincox@kevincox.ca>
pkgname='memory-pool-system'
pkgver='1.113.0'
pkgrel=1
pkgdesc='Flexible and adaptable memory manager.'
arch=('i686' 'x86_64')
url='http://www.ravenbrook.com/project/mps'
license=('custom:MPS Open Source License')
depends=()
source=("http://www.ravenbrook.com/project/mps/release/$pkgver/mps-kit-$pkgver.tar.gz")
sha1sums=('9c3409f099d33dcfab217bb4060168ac3ea3d2d4')

build()
{
	cd mps-kit-*
	gcc -O3 -fPIC -shared "-Wl,-soname,libmps.so.${pkgver%.*.*}" -o "libmps.so.$pkgver" code/mps.c
}

package()
{
	cd mps-kit-*
	mkdir -p  "$pkgdir/"{usr/lib/,usr/share/licenses/memory-pool-system/}
	install -m644 libmps.so* "$pkgdir/usr/lib/"
	install -m644 license.txt "$pkgdir/usr/share/licenses/memory-pool-system/"
}

pkgname=bdf2psf
pkgver=1.104
pkgrel=1
epoch=
pkgdesc="A utility for converting BDF fonts to PSF"
arch=(any)
url="http://unifoundry.com/pub/bdf2psf/"
license=('GPL')
depends=(perl)
makedepends=(libarchive)
source=("http://unifoundry.com/pub/bdf2psf/$pkgname-$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('87ff43e5a11510b9daa261764f4939ff55204c44dec0198638fd9e4fffda9dcb8bc118d5483ceea74448f84f1f377ec04019231ca9eab8c10f9dded630524df3')

package() {
	cd "$pkgdir"
	bsdtar zxf "$srcdir/$pkgname-$pkgver.tar.gz" --uid 0 --gid 0
}

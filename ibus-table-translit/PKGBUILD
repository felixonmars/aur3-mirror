pkgname=ibus-table-translit
pkgver=1.3.5
pkgrel=2
pkgdesc="Translit Russian input method for ibus-table"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://code.google.com/p/ibus/"
depends=('ibus-table')
source=(http://mirrors.us.kernel.org/ubuntu//pool/universe/i/ibus-table-others/ibus-table-translit_${pkgver}-${pkgrel}_all.deb)
md5sums=('87a96fedd5a99c84e596b2c4e0ef663b')

package() {
	# extracting data from tar archive
	cd "$srcdir"
	tar -xJf ./data.tar.xz
	# Copying all files to the installation directory
	cp -ar usr "${pkgdir}"	
    }


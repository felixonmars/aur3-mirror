# Maintainer: perlawk@althonx4

pkgname=monosim-bin
_pkgname=monosim
pkgver=2.0.0.0
_pkgver=r108-bin
pkgrel=1
pkgdesc='To read, write, update, delete and backup your sim card contacts with standard pcsc smartcard reader'
arch=('any')
url='http://www.integrazioneweb.com/monosim/'
license=('GPL')
depends=('mono' 'pcsclite' 'qt' 'gtk')
source=(
		"http://monosim.googlecode.com/files/${_pkgname}-$pkgver-${_pkgver}.zip" 
		"monosim-gtk"
		"monosim-qt")
install=

md5sums=('3f063994bdb31aad51a62bb20dac6888'
'12590d522387c40944cd14fecfb96f77 '
'd279d4e49f0eccc798cef799f056e335 '
)

build() {
  cd "${srcdir}/${_pkgname}-$pkgver-${_pkgver}"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib/monosim
}

package() {
  cp "${srcdir}/${_pkgname}-$pkgver-${_pkgver}"/* -a ${pkgdir}/usr/lib/monosim/
		cp ${srcdir}/monosim-gtk $pkgdir/usr/bin/
		cp ${srcdir}/monosim-qt $pkgdir/usr/bin/
}

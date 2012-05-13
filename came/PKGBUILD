# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Curtis Campbell <curtisjamescampbell@hotmail.com>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=came
_pkgname=camE
pkgver=1.9
pkgrel=6
pkgdesc="Replacement for xawtv webcam application"
arch=('i686' 'x86_64')
license=('GPL')
url='http://linuxbrit.co.uk/camE/'
depends=('v4l-utils' 'giblib' 'curl>=7.19.6')
source=("http://linuxbrit.co.uk/downloads/$_pkgname-$pkgver.tar.gz"
	'fix.patch'
	'camE-v4l2')
md5sums=('8bdc049b01cd32088eef8cccf3c096ab' '9a1cf8bee35cb31806cf754d61c2e127' '77edc45181f63fcf8a31472ea9214642')

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	msg 'Applying curl patch...'
	patch -Np0 -i "$srcdir/fix.patch"

	msg 'Running make...'
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	install -m755 -d "$pkgdir/usr/bin"
	install -m755 -d "$pkgdir/usr/share/came"

	install -m755 camE "$pkgdir/usr/bin/camE-v4l1"
	install -m755 "$srcdir/camE-v4l2" "$pkgdir/usr/bin/camE"
	install -m644 example.camErc "$pkgdir/usr/share/came/camErc"
	install -m644 example.camErc.ssh "$pkgdir/usr/share/came/camErc.ssh"
}

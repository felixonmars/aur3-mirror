# Maintainer: Schtroumpfette <fpeterschmitt@voila.fr>
pkgname=codeblocks-fr
pkgver=0.1
pkgrel=1
pkgdesc="French language for Code::Blocks 8.02 and SVN"
url=('http://forums.codeblocks.org/index.php/topic,1022.105.html')
license=('custom')
arch=('any')
depends=()
makedepends=('p7zip')
source=(http://pagesperso-orange.fr/thunderbird-noia2/All_codeblocks_fr_5421_090128.7z)
md5sums=('3fe28b42f947fb574322501b001d4aaf')

build() {
  cd $srcdir/$pkgname-$pkgver
	7z x All_codeblocks_fr_5421_090128.7z -y
	mkdir -p $pkgdir/usr/share/codeblocks/locale
	mkdir -p $pkgdir/usr/share/codeblocks/locale/fr_FR
	cp  All_codeblocks.mo $pkgdir/usr/share/codeblocks/locale/fr_FR/
	cp  All_codeblocks.po $pkgdir/usr/share/codeblocks/locale/fr_FR/
}

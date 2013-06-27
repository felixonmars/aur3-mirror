# Contributor: Alexander Kreuzer <alex at freesources _dot_org>
pkgname=stardict-freedict-lat-eng
pkgver=2.4.2
pkgrel=4
pkgdesc="Latin <-> English dictionary for Stardict."
arch=('any')
url="http://reciteword.cosoft.org.cn/stardict-iso/stardict-dic/freedict.de/"
license=('GPL')
source=(
http://abloz.com/huzheng/stardict-dic/freedict.de/stardict-freedict-lat-eng-2.4.2.tar.bz2
http://abloz.com/huzheng/stardict-dic/freedict.de/stardict-freedict-eng-lat-2.4.2.tar.bz2
)
md5sums=('24fa5a3cd523c52310058c98cfa87a6d'
	 '029739d92ee0b3484b7e177b2c426cef')

package() {

mkdir -p "$pkgdir/usr/share/stardict/dic"
install -m644 "$srcdir/stardict-freedict-lat-eng-2.4.2/dictd_www.freedict.de_lat-eng.dict.dz" \
"$srcdir/stardict-freedict-lat-eng-2.4.2/dictd_www.freedict.de_lat-eng.idx" \
"$srcdir/stardict-freedict-lat-eng-2.4.2/dictd_www.freedict.de_lat-eng.ifo" \
"$srcdir/stardict-freedict-eng-lat-2.4.2/dictd_www.freedict.de_eng-lat.dict.dz" \
"$srcdir/stardict-freedict-eng-lat-2.4.2/dictd_www.freedict.de_eng-lat.idx" \
"$srcdir/stardict-freedict-eng-lat-2.4.2/dictd_www.freedict.de_eng-lat.ifo" \
"$pkgdir/usr/share/stardict/dic/"

}


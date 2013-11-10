# Contributor: Alexander Kreuzer <alex at freesources _dot_org>
# Contributor: Juanma Hernández <juanmah@gmail.com>
pkgname=stardict-freedict-fr-en
pkgver=2.4.2
pkgrel=3
pkgdesc="French <-> English dictionary for Stardict"
arch=('any')
url="http://abloz.com/huzheng/stardict-dic"
license=('GPL')
source=(http://abloz.com/huzheng/stardict-dic/freedict.de/stardict-freedict-fra-eng-2.4.2.tar.bz2
	http://abloz.com/huzheng/stardict-dic/freedict.de/stardict-freedict-eng-fra-2.4.2.tar.bz2)
md5sums=('b293ea56ba3297df43f4a817c4ec5a61'
         '494485c69103b4171f9014c1f8746b38')

package() {

mkdir -p "$pkgdir/usr/share/stardict/dic"
install -m644 "$srcdir/stardict-freedict-fra-eng-2.4.2/dictd_www.freedict.de_fra-eng.dict.dz" \
"$srcdir/stardict-freedict-fra-eng-2.4.2/dictd_www.freedict.de_fra-eng.idx" \
"$srcdir/stardict-freedict-fra-eng-2.4.2/dictd_www.freedict.de_fra-eng.ifo" \
"$srcdir/stardict-freedict-eng-fra-2.4.2/dictd_www.freedict.de_eng-fra.dict.dz" \
"$srcdir/stardict-freedict-eng-fra-2.4.2/dictd_www.freedict.de_eng-fra.idx" \
"$srcdir/stardict-freedict-eng-fra-2.4.2/dictd_www.freedict.de_eng-fra.ifo" \
"$pkgdir/usr/share/stardict/dic/"

}

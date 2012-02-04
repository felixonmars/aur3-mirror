# Contributor: Gu, Cong <gucong43216@gmail.com>

pkgname=stardict-collins-plain
pkgver=2.4.2
pkgrel=1
pkgdesc="Collins COBUILD Advanced Learner's English Dictionary for StarDict (dictd version)"
arch=('i686' 'x86_64')
depends=('stardict')
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('6cd2eb178a3a33888d87acdb6d556ed3')
source=(http://reciteword.cosoft.org.cn/stardict-iso/stardict-dic/dict.org/stardict-cced-$pkgver.tar.bz2)

build() {
	cd $startdir/src/stardict-cced-$pkgver/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/collins
	install -m 644 cced.dict.dz \
                   cced.idx \
	               cced.ifo \
	               $startdir/pkg/usr/share/stardict/dic/collins
}

# Contributor: Gu, Cong <gucong43216@gmail.com>

pkgname=stardict-longman-plain
pkgver=2.4.2
pkgrel=1
pkgdesc="Longman Dictionary of Contemporary English for StarDict (dictd version)"
arch=('i686' 'x86_64')
depends=('stardict')
url="http://stardict.sourceforge.net"
license=('GPL')
md5sums=('7c29fcd1eda7d1d946337ad57c3f0a0f')
source=(http://reciteword.cosoft.org.cn/stardict-iso/stardict-dic/dict.org/stardict-longman-$pkgver.tar.bz2)

build() {
	cd $startdir/src/stardict-longman-$pkgver
	mkdir -p $startdir/pkg/usr/share/stardict/dic/longman
	install -m 644 longman.dict.dz \
                   longman.idx \
                   longman.ifo \
	               $startdir/pkg/usr/share/stardict/dic/longman
}

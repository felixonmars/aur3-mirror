# Contributor: Zhukov Pavel <gelios@gmail.com>

pkgname=stardict-ru_pack
pkgver=1.0
pkgrel=1
pkgdesc="30 ru-en, en-ru and ru-ru dictionaries for Stardict"
makedepends=('unrar')
depends=('stardict')
arch=('x86_64' 'i686')
url="http://stardict.sourceforge.net"

md5sums=('b4203b67b8196bf271fb5b51ff3c25bf')
sha1sums=('ecdde44e7e77d17d71f6eafbb68870347d72c9b4')

source=(ftp://ftp.msiu.ru/education/FSF-Windows/stardict/dicts/stardict-dicts.exe)

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	unrar x stardict-dicts.exe $startdir/pkg/usr/share/stardict/dic/
}

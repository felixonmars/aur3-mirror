# Maintainer: sungmin jo <linukizx at gmail.com>

pkgname=stardict-ko-ru
pkgver=2.4.2
pkgrel=1
pkgdesc="Korean to Russian dictionary for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
source=(http://sourceforge.net/projects/stardict/files/stardict-dictionaries-ko/$pkgver/stardict-GPL_korean-russian-dic-$pkgver.tar.bz2/download)
arch=('any')
md5sums=('acc3b4ac0a37ceb4937633638478edf7')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	cp -r stardict-GPL_korean-russian-dic-$pkgver/ $startdir/pkg/usr/share/stardict/dic/korean-russian-dic
}



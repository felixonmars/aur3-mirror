# Contributor: leeghoofd <abcdefg@solcon.nl>
# Contributor: Lukasz Fidosz <virhilo@gmail.com>
# Maintainer: Marek Otahal <markotahal g_ma_il>
pkgname=sphinx4
pkgver=1.0beta6
pkgrel=4
pkgdesc="A voice (speech) recognition (dictation) 'lib' written in Java by CMU, binary version"
url="http://cmusphinx.sourceforge.net/sphinx4/"
makedepends=('unzip' 'sharutils')
depends=('java-runtime' 'bash')
license="BSD"
arch=(i686 x86_64)
source="http://downloads.sourceforge.net/cmusphinx/$pkgname-$pkgver-bin.zip"
md5sums=('fdae01d3b5d0bf6f58d27e08a95aeb2e')
install='sphinx4.install'
build() {
	install -d $pkgdir/opt/$pkgname
	cp -a $srcdir/$pkgname-$pkgver/* $pkgdir/opt/$pkgname
	cd $pkgdir/opt/$pkgname/lib
	rm -f jsapi.exe
	cat jsapi.sh | head -n 188 | tail -n 174 > JSAPI_LICENSE
	cat jsapi.sh | tail -n 1232 > jsapi-no-license.sh
	chmod +x jsapi-no-license.sh
	sh jsapi-no-license.sh
}


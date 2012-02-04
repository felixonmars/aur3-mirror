# Former Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Leonardo A. Gallego <leonardo@archlinux-es.org>
# Contributor: Jeremy Sands <cto@jeremysands.com>

pkgname=qhacc
pkgver=3.5
pkgrel=1
license="GPL"
arch=('i686' 'x86_64')
options=(libtool)
pkgdesc="Simple home accounting application."
url="http://qhacc.sourceforge.net/"
makedepends=(sqlite3 libmysqlclient postgresql-libs libofx)
depends=('qt3')
optdepends=(
	'sqlite3: sqlite database support'
	'libmysqlclient: MySQL database support'
	'postgresql-libs: PostgreSQL database support'
	'libofx: OFX banking standard support'
)
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz qhacc-missing-include.patch qhacc.desktop)
md5sums=('333fce03fc508278baf53aa87db3a147'
         '4a0666f3baffbf3f30a6990152bf5a9b'
         '267ad651aa9712a2fe5a21918902c7a1')
sha1sums=('8d886f84a0378257c4b6f9ff2907d0ed60afea92'
          '40262e149b298443a7ca356045fdbbd7e0941115'
          'c1ed2441933270494a94c8d07fc01ac965a2f2dc')
sha256sums=('200dbab16a07f3c4e639dbd1582e15e6dc7f320766a3d29083a1b5119a1e85e8'
            '9a0fddc4ef6223fd0b58eae72ade205f4f9b300deb3fc03a5b339e9826890823'
            '09819e8a5a6d35e7b5959df3ce6a29415393e2af847171dcb55465bc53a0b3b5')
sha384sums=('3147c3b885e6e27ce2c85b575e34f9600a87d100d4b497dea06798c06bd0f19c620c4653d0f55b19cb354370b3c69b4a'
            '96190ce0542673f2d260b49aab31eb86e6dc779a81ef1c9f2c5d3ae628ea37a1a201e0865e7282b162207238f6f612ab'
            'a26e4f266c65e345338e093b9d8435cc36a47978fdbc34abe0bf6f309b25f9954607de802a89a9ba3dbb531c79b45fbf')
sha512sums=('fe56e8944df11778452f0389fdb5182a771b18c500380efe1f8a07067ff2ea3404170d3d37d2aafecf4f2cd5a728297599616030aa2bfd74b0014b93af89a4d0'
            'a16c13afc0477fc7b8d9c8b1e55117544c3aafc328686ce286af1b4e6e5eba25214b409d5024074187383864abe33d1622db4c70cb5cce1fa42466b43bcdde0e'
            '28012f43bb4ed92574920c05e1817afb195e8b9cb582aaa8ee2411042c9968ac20e631b7bd37ffd6be3037032632393139d2a76d441a34bdbd6a7be7aef1fb88')

build() {
	cd $startdir/src/$pkgname-$pkgver
	patch -p1 -s <../qhacc-missing-include.patch || return 1
	./configure --prefix=/usr --libdir=/usr/lib/qhacc --with-qt-moc=/opt/qt/bin --with-qt-libs=/opt/qt/lib --with-qt-includes=/opt/qt/include --enable-mysql --enable-psql --enable-sqlite --enable-ofx --with-ofx-includes=/usr/include/libofx || return 1
	make -j1 || return 1
	make DESTDIR=$startdir/pkg/ install || return 1
	install -m 755 -d $startdir/pkg/usr/share/applications
	install -m 644 ../qhacc.desktop $startdir/pkg/usr/share/applications
	rm $startdir/pkg/usr/lib/qhacc/*.{a,la}
}

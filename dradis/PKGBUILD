pkgname=dradis
pkgver=2.7.0
pkgrel=2
pkgdesc="Open source framework to enable effective information sharing"
arch=('i686' 'x86_64')
url="http://dradisframework.org/"
license=('GPL2')
options=('!emptydirs')
depends=('sqlite3' 'sqlite3-ruby' 'ruby-bundler' 'ruby-redcloth' 'ruby-rails' 'ruby-factory_girl' 'ruby-nokogiri' 'ruby-thor' 'ruby-rspec-rails')
install='install'
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-v$pkgver.tar.bz2" \
	"Gemfile.patch")
md5sums=('94df3099cadc044569718a7bdeecec5e'
         '5d30b6b5116eb8ede07cd478b47d9f85')

package() {
	cd "$srcdir/$pkgname-2.7"
	install -d $pkgdir/{usr/bin,opt/$pkgname}
	cp -aR {readme.txt,*.sh} \
		$pkgdir/opt/$pkgname/

	patch -Np0 < $srcdir/Gemfile.patch
	cp -R server/ \
		$pkgdir/opt/$pkgname/
	
	#Fix location of "server" dir
	sed -i 's|cd server|cd /opt/dradis/server|g' start.sh reset.sh
	install -Dm755 start.sh \
		$pkgdir/usr/bin/$pkgname-start

	install -Dm755 reset.sh \
		$pkgdir/usr/bin/$pkgname-reset
	mv $pkgdir/opt/$pkgname/server/config/database.yml.template $pkgdir/opt/$pkgname/server/config/database.yml
	
	


}

#Contributor v2punkt0 <v2punkt0@gmail.com>

pkgname=ruby-odbc
pkgver=0.9997
pkgrel=1
pkgdesc='ODBC binding for Ruby'
url='http://www.ch-werner.de/rubyodbc/'
license='GPL'
arch=('i686' 'x86_64')
depends=('ruby1.8')
source=(http://www.ch-werner.de/rubyodbc/$pkgname-$pkgver.tar.gz)
md5sums=('36d21519795c3edc8bc63b1ec6682b99')

build() {
    cd $srcdir/$pkgname-$pkgver
    ruby-1.8 extconf.rb
    make || return 1 
    make DESTDIR=$pkgdir  install
    install -Dm644 GPL $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

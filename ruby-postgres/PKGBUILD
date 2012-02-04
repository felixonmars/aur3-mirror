# Contributor: tochiro@no.spam.mail.berlios.de
pkgname=ruby-postgres
pkgver=0.7.1
pkgrel=5
pkgdesc="Library to access a PostgreSQL database from Ruby"
arch=('i686' 'x86_64')
url="http://ruby.scripting.ca/postgres/"
license=('custom')
depends=('ruby' 'postgresql')
source=(http://ruby.scripting.ca/postgres/archive/$pkgname-$pkgver.tar.gz \
	LICENSE.txt)
md5sums=('8ef67b3f4b089248f0420baeb0e3b3c8' '68d59ff8306e3a9f5f1c01462c77a317')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ruby extconf.rb || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install

 install -D -m644 ../LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt
}

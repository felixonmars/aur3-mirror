# Contributor: oleg dashevskii <olegdashevskii@gmail.com>

_pkg=passenger
pkgname=passenger-enterprise-apache2
pkgver=2.2.9
pkgrel=1
pkgdesc="mod_rails passenger module for apache2"
arch=('i686' 'x86_64')
url="http://www.modrails.com"
license=('GPL')
depends=('apache' 'ruby-enterprise' 'passenger-enterprise-common')
source=(http://rubyforge.org/frs/download.php/68051/$_pkg-$pkgver.tar.gz)
md5sums=('ca4379e87db2de0336e5b096d296a767')
install=$_pkg.install

build(){
  cd $srcdir/$_pkg-$pkgver
  /opt/ruby-enterprise/bin/rake apache2

  # adapted from Rakefile (task fakeroot)
  libexecdir=$pkgdir/opt/ruby-enterprise/lib/phusion_passenger

  mkdir -p $libexecdir
  cp ext/apache2/mod_passenger.so $libexecdir/
  sed -i 's|#!/usr/bin/env ruby|#!/opt/ruby-enterprise/bin/ruby|' bin/passenger-spawn-server
  cp bin/passenger-spawn-server $libexecdir/
  cp ext/apache2/ApplicationPoolServerExecutable $libexecdir/
}

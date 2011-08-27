# Contributor: oleg dashevskii <olegdashevskii@gmail.com>

_pkg=passenger
pkgname=passenger-enterprise-common
pkgver=2.2.9
pkgrel=1
pkgdesc="mod_rails passenger common code"
arch=('i686' 'x86_64')
url="http://www.modrails.com"
license=('GPL')
depends=('ruby-enterprise')
source=(http://rubyforge.org/frs/download.php/68501/$_pkg-$pkgver.tar.gz)
md5sums=('ca4379e87db2de0336e5b096d296a767')

build(){
  cd $srcdir/$_pkg-$pkgver
  /opt/ruby-enterprise/bin/rake native_support doc

  # adapted from Rakefile (task fakeroot)
  libdir=$pkgdir/opt/ruby-enterprise/lib/ruby/1.8
  extdir=$libdir/`ruby -e 'print RUBY_PLATFORM'`
  bindir=$pkgdir/opt/ruby-enterprise/bin
  docdir=$pkgdir/opt/ruby-enterprise/share/doc/phusion_passenger

  mkdir -p $libdir
  cp -R lib/phusion_passenger $libdir/

  mkdir -p $extdir/phusion_passenger
  cp -R ext/phusion_passenger/*.so $extdir/phusion_passenger/

  mkdir -p $bindir
  cp bin/* $bindir/

  mkdir -p $docdir
  cp -R doc/* $docdir/
  rm -rf $docdir/definitions.h $docdir/Doxyfile $docdir/template

  # fix ruby invocation
  sed -i 's|#!/usr/bin/env ruby|#!/opt/ruby-enterprise/bin/ruby|' $bindir/*
}

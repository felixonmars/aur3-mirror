# Maintainer: Jipuf <jipuf@gmx.fr>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: v01d

pkgname=rubygems1.8
pkgver=1.8.28
pkgrel=1
pkgdesc="A package management framework for the Ruby programming language"
arch=('any')
url="http://docs.rubygems.org"
license=('MIT')
depends=('ruby1.8')
source=(https://github.com/rubygems/rubygems/archive/v1.8.28.tar.gz)
provides=('rubygems')
md5sums=('13ba40a98e7817151f35ef77eb11d914')

build() {
  export RUBYOPT=
  export GEM_HOME=${pkgdir}/opt/ruby1.8/lib/ruby/gems/1.8
  cd $srcdir/rubygems-$pkgver
  ruby-1.8 setup.rb --prefix=${pkgdir}/opt/ruby1.8
  mkdir -p ${pkgdir}/opt/ruby1.8/lib/ruby/site_ruby/1.8
  cd ${pkgdir}/opt/ruby1.8/lib
  mv rbconfig rubygems rubygems.rb ubygems.rb ${pkgdir}/opt/ruby1.8/lib/ruby/site_ruby/1.8

  sed -ri 's|#!.+$|#!/usr/bin/ruby-1.8|' $pkgdir/opt/ruby1.8/bin/gem

  mkdir -p $pkgdir/usr/bin/
  ln -s /opt/ruby1.8/bin/gem $pkgdir/usr/bin/gem-1.8
}

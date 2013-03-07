# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: v01d

pkgname=rubygems1.8.25
pkgver=1.3.7
pkgrel=2
pkgdesc="A package management framework for the Ruby programming language"
arch=('any')
url="http://docs.rubygems.org"
license=("GPL")
depends=('ruby1.8')
source=(http://rubyforge.org/frs/download.php/76729/rubygems-1.8.25.tgz)
provides=('rubygems')
sha256sums=('649348ddf8746887fb1ee79c55dc508f0627d3d0bfa7fcdbcd4edb24908f1cc8')

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


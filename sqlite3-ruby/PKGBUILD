# $Id: PKGBUILD 20546 2010-07-09 04:28:23Z tdziedzic $
# Contributor: William Rea <sillywilly@gmail.com>
# Previous Maintainer: Bjorn Lindeijer <bjorn lindeijer nl>
# Previous Maintainer: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Maintainer: Alexsandr Pavlov <kidoz at mail dot ru>

pkgname=sqlite3-ruby
pkgver=1.3.3
pkgrel=3
pkgdesc="A Ruby interface for the SQLite3 database engine."
arch=('i686' 'x86_64')
url="http://rubygems.org/gems/sqlite3-ruby"
license=('BSD')
depends=('ruby' 'ruby-hoe' 'ruby-rake-compiler' 'ruby-rubyforge' 'sqlite3')
makedepends=(rubygems)
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
md5sums=('fb6a4837495c211f7553e5daffa67a01')

build() {
  cd $srcdir
  # _gemdir is defined inside build() because if ruby[gems] is not installed on the system
  # makepkg will exit with an error when sourcing the PKGBUILD
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" $pkgname-$pkgver.gem
 }

# Contributor: Danny Tatom <dannytatom[at]gmail.com>
# Maintainer: James Pearson <james.m.pearson+arch@gmail.com>

pkgname=limgur
pkgver=2.0.0
pkgrel=1
pkgdesc="CLI to Imgur, letting you upload and delete images."
arch=(any)
url="http://github.com/xiongchiamiov/limgur"
depends=('ruby' 'ruby-curb')
optdepends=('scrot: for direct screenshot-upload capabilities')
license=('MIT')
groups=('multimedia')
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
md5sums=('fe0a5f3658c2e15e90f06597b791b1e7')

build(){
  cd $srcdir
  # _gemdir is defined inside build() because if ruby[gems] is not installed on the system
  #  makepkg will barf when sourcing the PKGBUILD
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
 
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" $pkgname-$pkgver.gem
}

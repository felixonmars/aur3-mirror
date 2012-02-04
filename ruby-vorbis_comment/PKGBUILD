# Maintainer: Jörg Hansen <joerg.hansen@ymail.com>

gemname=vorbis_comment
pkgname=ruby-$gemname
pkgver=1.0.1
pkgrel=1
pkgdesc="Ruby library for reading/writing vorbis comments "
arch=('any')
url="https://github.com/jeremyevans/ruby-vorbis_comment"
license=('RUBY')
depends=('ruby-cicphash>=1.0.0' 'libvorbis')
makedepends=(rubygems)
source=(https://rubygems.org/downloads/$gemname-$pkgver.gem)
noextract=($gemname-$pkgver.gem)
md5sums=('b13e113515f62240b6dc0761456b42a4')

build() {
    cd $srcdir
    local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --verbose -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin $gemname-$pkgver.gem
}

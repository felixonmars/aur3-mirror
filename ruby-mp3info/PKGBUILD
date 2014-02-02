# Contributor: Jörg Hansen <joerg.hansen@ymail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Maintainer: Ashok `ScriptDevil` Gautham <ScriptDevil@gmail.com>

pkgname=ruby-mp3info
pkgver=0.6.18
pkgrel=1
pkgdesc="Library for reading low-level informations and manipulate tags on mp3 files"
arch=('any')
url="http://ruby-mp3info.rubyforge.org"
license=('RUBY')
depends=('ruby')
makedepends=(rubygems)
source=(https://rubygems.org/downloads/mp3info-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('ab17537c19328507fcb923fed80e13ef523525b5b02525d4676a2ac95db38990')

package() {
    cd $srcdir
    local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --verbose -i "$pkgdir$_gemdir" -n "$pkgdir"/usr/bin mp3info-$pkgver.gem
}

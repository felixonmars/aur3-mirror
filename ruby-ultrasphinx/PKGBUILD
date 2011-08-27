# Contributor: gem2arch 0.1
pkgname=ruby-ultrasphinx
pkgver=1.11
_realname="ultrasphinx"
pkgrel=1
pkgdesc="Ruby on Rails configurator and client to the Sphinx fulltext search engine."
arch=(any)
url="http://blog.evanweaver.com/files/doc/fauna/ultrasphinx/"
license=("GPL")
depends=('ruby')
source=(http://gems.rubyforge.org/gems/ultrasphinx-$pkgver.gem)
noextract=(ultrasphinx-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}
md5sums=('b598a40ab096a73419827e0f96901826')

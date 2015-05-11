# Maintainer: tuftedocelot@fastmail.fm
# Submitter: Tom Vincent <http://tlvince.com/contact>
pkgname=gollum
pkgver=4.0.0
pkgrel=1
pkgdesc="A simple, Git-powered wiki."
arch=('any')
url="http://github.com/gollum/gollum"
license=('MIT')
depends=('ruby' 'ruby-grit' 'ruby-github-markup'
'ruby-github-markdown' 'ruby-pygments.rb' 
'ruby-sinatra' 'ruby-mustache' 'ruby-sanitize-2.1.0' 
'ruby-nokogiri' 'ruby-useragent' 'ruby-stringex' 
'ruby-gollum-lib' 'ruby-kramdown')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem 'gollum@.service')
noextract=($pkgname-$pkgver.gem)
md5sums=('06f930f1be68e7d06d4c7c748fc9d8f3'
         'ad5367a97c672497f5e6af9d4e863391')
install="gollum.install"

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem

  install -Dm644 gollum@.service "${pkgdir}"/usr/share/doc/gollum/gollum@.service
}

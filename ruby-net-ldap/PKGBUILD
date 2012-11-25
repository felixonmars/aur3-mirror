# Maintainer: Aravind Gottipati <aravind@freeshell.org>

pkgname=ruby-net-ldap
pkgver=0.2.2
pkgrel=1
pkgdesc="A Ruby library for talking to LDAP servers"
arch=('any')
url="http://rubyforge.org/projects/net-ldap/"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/net-ldap-$pkgver.gem)
md5sums=('96447b2cb5369cb6ac96197817a5cc23')

build() {
  cd "$srcdir"
  bsdtar -xf data.tar.gz || return 1
  find /usr/lib/ruby/gems -maxdepth 1 -type d -name '1.*' \
    -exec gem install net-ldap-$pkgver.gem -i "$pkgdir{}" \;
}

# Maintainer: OmeGa <omega at mailoo dot org>
# Contributor: Guilherme "nirev" Nogueira <guilherme@nirev.org>
# This package was made by OmeGa and I simply changed the dependency in order to be able to install.

pkgname=rhc-fixed-dependency
pkgver=1.35.1
pkgrel=1
pkgdesc="The client tools for the OpenShift plataform with fixed dependencys (requieres ruby-highline-1.6)"
arch=('any')
url="https://github.com/openshift/rhc"
license=('Apache')
depends=('ruby' 'ruby-archive-tar-minitar' 'ruby-commander' 'ruby-highline-1.6' 'ruby-httpclient'
         'ruby-net-scp' 'ruby-net-ssh' 'ruby-net-ssh-multi' 'ruby-open4')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/rhc-$pkgver.gem)
noextract=(rhc-$pkgver.gem)
sha1sums=('6560944ac7eb564c4c61c168c090e526c80ce411')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
}

# vim:set ts=2 sw=2 et:

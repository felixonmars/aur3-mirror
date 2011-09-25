# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=ruby-introspection
pkgver=0.0.2
pkgrel=1
pkgdesc="Dynamic inspection of the hierarchy of method definitions on a Ruby object."
arch=('any')
license=('MIT')
url="http://jamesmead.org"
depends=('ruby' 'ruby-metaclass' 'ruby-instantiator')
source=("http://gems.rubyforge.org/gems/introspection-${pkgver}.gem")
noextract=("introspection-${pkgver}.gem")

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" introspection-$pkgver.gem \
    -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
md5sums=('f1165a44ca88b870835b57360604694c')

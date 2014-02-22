# $Id$
# Maintainer: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/chef/PKGBUILD

# Note: chef physically depends on ruby-mime-types<2.0.0
# so either install the mime-types 1.25 rubygem:
#    1) manually, or
#    2) with https://github.com/flaccid/archlinux-packages/blob/master/ruby-mime-types/PKGBUILD
# If installed by pacman package add ruby-mime-types to IgnorePkg in /etc/pacman.conf
# (so it is not upgraded with the official repos)
#
# Additionally, Chef is behind with net-ssh-multi, apply the same method and install 1.1(.0) from
#   https://github.com/flaccid/archlinux-packages/blob/master/ruby-net-ssh-multi/PKGBUILD
#
# Also, install a version of the puma gem <2.0.0:
#   # gem install puma --version=1.6.3

_gemname=chef
pkgname=chef
pkgver=11.10.4
pkgrel=1
pkgdesc="A systems integration framework, built to bring the benefits of configuration management to your entire infrastructure."
arch=(any)
url="http://www.opscode.com/chef/"
license=('Apache 2.0')
depends=('ruby'
  'chef-zero>=1.7.2'
  'ruby-diff-lcs>=1.2.4'
  'ruby-erubis>=2.7.0'
  'ruby-highline>=1.6.9'
  'ruby-json>=1.8.1'
  'ruby-mime-types<2.0'
  'ruby-mixlib-authentication>=1.3.0'
  'ruby-mixlib-cli>=1.4.0'
  'ruby-mixlib-config>=2.0.0'
  'ruby-mixlib-log>=1.3.0'
  'ruby-mixlib-shellout>=1.3.0'
  'ruby-net-ssh>=2.6.0'
  'ruby-net-ssh-multi>=1.1.0'
  'ohai>=6.0.0'
  'pry>=0.9.0'
  'puma<2.0.0'
  'ruby-rest-client=<1.7.0'
  'ruby-yajl-ruby>=1.1.0'
)
makedepends=(rubygems)
conflicts=(ruby-chef)
replaces=(ruby-chef)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('f16466d7d04ce715ab26512d1debf4e0')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts= 2 sw=2 Et:

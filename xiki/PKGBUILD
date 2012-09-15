# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=xiki
pkgver=0.6.3
pkgrel=1
pkgdesc="A shell console with GUI features."
arch=(any)
url="http://xiki.org"
license=(MIT)
depends=('ruby'
         'ruby-file-tail'
         'ruby-activesupport'
         'ruby-daemons'
         'ruby-net-scp'
         'ruby-net-sftp'
         'ruby-net-ssh'
         'ruby-rspec'
         'ruby-httparty'
         'ruby-method_source'
         'ruby-ruby_parser'
         'ruby-sourcify'
         'ruby-trogdoro-el4r>=1.0.7')
makedepends=(rubygems)
changelog=Changelog
conflicts=(${pkgname}-git)
source=(http://gems.rubyforge.org/gems/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
md5sums=('043d599e3043f8da14160e4a780aff65')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$pkgname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:

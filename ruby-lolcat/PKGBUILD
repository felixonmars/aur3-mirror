# Maintainer: Gordin <9ordin @t gmail dot com>
pkgname=ruby-lolcat
pkgver=42.0.99
pkgrel=2
pkgdesc="Okay, no unicorns. But rainbows!!"
arch=('any')
url="https://github.com/busyloop/lolcat"
license=('custom')
groups=()
depends=('ruby-paint' 'ruby-trollop')
makedepends=('rubygems')
source=("http://gems.rubyforge.org/gems/lolcat-${pkgver}.gem"
        "LICENSE")
noextract=("lolcat-${pkgver}.gem")
sha256sums=('cafd788a6b3e0177a20a9e44dfbb144ea0b6b62c9c9fb413c5223778cdd92558'
            'c69ed68957074c03871da8cdd94fb531311a8cea181d12a39c6ca4d550fcf8fd')

build() {
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" lolcat-$pkgver.gem \
  -n "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:

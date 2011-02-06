# Contributor: Arian Kuschki  <arian.spam-trap-remove-mekuschki at gmail dot com>
pkgname=ruby-lightning
pkgver=0.3.2
pkgrel=8
pkgdesc="Lightning is a commandline framework that generates shell functions which wrap around commands to autocomplete and translate full paths by their basenames."
arch=('any')
url="http://tagaholic.me/lightning"
license=(MIT)
depends=(ruby)
makedepends=('rubygems')
install=ruby-lightning.install
source=("http://gems.rubyforge.org/gems/lightning-${pkgver}.gem")
noextract=("lightning-${pkgver}.gem")
md5sums=('f8afac99fdcc8c7c4171f048830b57cf')


build() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies -i "$pkgdir$_gemdir" lightning-$pkgver.gem \
  -n "$pkgdir/usr/bin"

  mkdir -p ${pkgdir}/usr/share/licenses/ruby-lightning
  ln -s ${pkgdir}/usr/lib/ruby/gems/1.9.1/gems/lightning-0.3.2/LICENSE.txt ${pkgdir}/usr/share/licenses/ruby-lightning/LICENSE
}

# vim:set ts=2 sw=2 et:

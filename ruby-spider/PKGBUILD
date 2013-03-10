# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Ruby_Gem_Package_Guidelines for more
# information on Ruby Gem packaging.

# Maintainer: Mauro Andreolini <mauro.andreolini@unimore.it>
_gemname=spider
pkgname=ruby-$_gemname
pkgver=0.4.4
pkgrel=1
pkgdesc=""
arch=(any)
url="https://github.com/johnewart/ruby-spider"
license=('custom')
depends=(ruby) # Full dependency information is available in the yaml specification
makedepends=(rubygems)
source=("http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem"
  "LICENSE")
noextract=($_gemname-$pkgver.gem)
md5sums=()
md5sums=('2721ec80f548b548dc3c5c9b3f893c60'
         'bde72d94234000acb8e9edcb35480a27')


package() {
  cd "$srcdir"
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

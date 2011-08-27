# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Andrei "Garoth" Thorp <garoth at (the famous) g mail dot com>
# NOTE: this package will pull in ruby dependencies. This may cause
#       filesystem conflicts if you have a lot of ruby stuff. Comment them
#       out in the dependencies section to solve this.

pkgname=rubygame
pkgver=2.6.4
pkgrel=1
pkgdesc="A game-development extension and library for the Ruby language"
arch=('i686' 'x86_64')
url="http://$pkgname.org/"
license=('LGPL')
depends=('ruby>=1.8' 'sdl_gfx' 'sdl_image' 'sdl_ttf' 'sdl_mixer' 'ruby-ffi' )
makedepends=('ruby')
source=(http://gems.rubyforge.org/gems/$pkgname-$pkgver.gem)
md5sums=('dcf7620c0a3af711719dafe92b90b660')

build() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  local _target="${pkgdir}${_gemdir}"
  local _bintarget="$pkgdir/usr/bin"
  local _args="--ignore-dependencies"

  # Install rubygames' dependencies. If any of these cause conflicts,
  # comment them out.
  gem install ${_args} -i "${target}" -n "${bintarget}" \
    nice-ffi --version ">= 0.2"
  gem install ${_args} -i "${target}" -n "${bintarget}" \
    ruby-sdl-ffi --version ">= 0.2"

  gem install ${_args} -i "${_target}" ${pkgname}-${pkgver}.gem \
                       -n "${_bintarget}"
}

# Contributor: Luca Cesari < luca.cesari AT freakmind DOT org>
_gemname=tmuxinator
pkgname=ruby-tmuxinator
pkgver=0.5.0
pkgrel=3
pkgdesc="Manage complex tmux sessions easily"
arch=(any)
url="https://github.com/aziz/tmuxinator"
license=(MIT)
depends=(ruby) 
makedepends=(rubygems)
source=(http://rubygems.org/downloads/tmuxinator-$pkgver.gem)
noextract=(tmuxinator-$pkgver.gem)
md5sums=(2f6527e28793c733dd9cd452d312d7e3)

package() {
    cd $srcdir
    export HOME=/tmp
    local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
    gem install --no-user-install --ignore-dependencies -i "${pkgdir}${_gemdir}" -n ${pkgdir}/usr/bin ${_gemname}-${pkgver}.gem
}

# vim:set ts=2 sw=2 et:

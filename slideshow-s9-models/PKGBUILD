# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=slideshow-s9-models
pkgver=2.5.0
pkgrel=1
pkgdesc="Slide Show (S9) models 'n' machinery for easy (re)use"
arch=(any)
url="http://slideshow-s9.github.io/"
license=('custom')
depends=('ruby' 'ruby-activesupport' 'ruby-logutils' 'ruby-markdown' 'ruby-pakman' 'ruby-props' 'ruby-textutils')
source=("http://gems.rubyforge.org/gems/slideshow-models-${pkgver}.gem"
        'LICENSE')
noextract=("slideshow-models-${pkgver}.gem")
sha256sums=('1f3bbbf2cd67751d728f4198d1f9a33de77923ab6e812f62ab428c44e7d6e47d'
            'cc804ff578178822d33e518bafcdc0d408b9ea503c55cd9c0cdefdb25b870c03')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "slideshow-models-${pkgver}.gem"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

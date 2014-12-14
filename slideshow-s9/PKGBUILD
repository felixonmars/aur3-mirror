# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=slideshow-s9
pkgver=2.4.1
pkgrel=1
pkgdesc="A Free Web Alternative to PowerPoint and Keynote in Ruby"
arch=(any)
url="http://slideshow-s9.github.io/"
license=('custom')
depends=('ruby' 'ruby-gli' 'slideshow-s9-models' 'slideshow-s9-templates')
source=("http://gems.rubyforge.org/gems/slideshow-${pkgver}.gem"
        'LICENSE')
noextract=("slideshow-${pkgver}.gem")
sha256sums=('21b7998824c5e795078d6e7c6106230314a8378fec8e5371d0da2c6bdce9b00c'
            'cc804ff578178822d33e518bafcdc0d408b9ea503c55cd9c0cdefdb25b870c03')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "slideshow-${pkgver}.gem"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=slideshow-s9-templates
pkgver=2.4.0
pkgrel=1
pkgdesc="Bundles builtin slide show (S9) templates 'n' snippets"
arch=(any)
url="http://slideshow-s9.github.io/"
license=('custom')
depends=('ruby')
source=("http://gems.rubyforge.org/gems/slideshow-templates-${pkgver}.gem"
        'LICENSE')
noextract=("slideshow-templates-${pkgver}.gem")
sha256sums=('e71e54a0b5cfeacd480747153fc4608dd939dbfc063d5e602aeca54d6e9451aa'
            'cc804ff578178822d33e518bafcdc0d408b9ea503c55cd9c0cdefdb25b870c03')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "$pkgdir/usr/bin" "slideshow-templates-${pkgver}.gem"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=ruby-markdown
pkgver=1.2.0
pkgrel=1
pkgdesc="Markdown Engine Wrapper - Use Your Markdown Library of Choice"
arch=(any)
url="https://github.com/rubylibs/markdown"
license=('custom')
depends=('ruby' 'ruby-kramdown' 'ruby-props' 'ruby-textutils')
source=("http://gems.rubyforge.org/gems/markdown-${pkgver}.gem"
        'LICENSE')
noextract=("markdown-${pkgver}.gem")
sha256sums=('ede970a64b8cd4ecf0dd9e53a41e55000e442efece30ce3f00efe6c30721e01b'
            '023aba892784a7b98bb10ec674751131758b32e1b0bf7dc29c09c5ade485b866')

package() {
    local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

    gem install --no-user-install --ignore-dependencies \
      -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" "markdown-${pkgver}.gem"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


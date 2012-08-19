# Maintainer: Bert Muennich <be.muennich at gmail.com>

pkgname="urxvt-perls"
pkgver=2.0
pkgrel=1
pkgdesc="Perl extensions for the rxvt-unicode terminal emulator"
arch=("any")
depends=('rxvt-unicode')
conflicts=('urxvt-clipboard' 'urxvt-keyboard-select' 'urxvt-url-select')
install='urxvt-perls.install'
license=("GPL")
url='http://www.github.com/muennich/urxvt-perls'
source=(https://github.com/downloads/muennich/urxvt-perls/${pkgname}-${pkgver}.tar.gz)
md5sums=('345dc76bb7943ccba678b39979502435')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for ext in "clipboard" "keyboard-select" "url-select"; do
    install -D -m 644 "${ext}" "${pkgdir}/usr/lib/urxvt/perl/${ext}"
  done
}

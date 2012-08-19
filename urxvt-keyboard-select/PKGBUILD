# Maintainer: Bert Muennich <be.muennich at gmail.com>

pkgname="urxvt-keyboard-select"
pkgver=2.0
pkgrel=1
pkgdesc="Mouseless text selection for rxvt-unicode"
arch=("any")
depends=('rxvt-unicode')
install='urxvt-keyboard-select.install'
license=("GPL")
url='http://www.github.com/muennich/urxvt-perls'
source=(https://github.com/downloads/muennich/urxvt-perls/urxvt-perls-$pkgver.tar.gz)
md5sums=('345dc76bb7943ccba678b39979502435')

_extension="keyboard-select"

build() {
  cd "${srcdir}/urxvt-perls-${pkgver}"

  install -D -m 644 "${_extension}" "${pkgdir}/usr/lib/urxvt/perl/${_extension}"
}

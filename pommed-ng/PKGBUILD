# Maintainer: Tim Hütz <tim@huetz.biz>

# Forked from pommed. Previous header:
# Maintainer: Corrado Primier <ilbardo gmail com>
# Contributor: Other contributors existed but lost information
# Contributor: dpevp <daniel.plaza.espi@gmail.com>
# Contributor: jordi Cerdan (jcerdan) <jcerdan@tecob.com>

pkgname=pommed-ng
pkgver=1.0.1
pkgrel=2
pkgdesc="Handles the hotkeys of Apple MacBook (Pro) laptops"
arch=('i686' 'x86_64')
url="https://github.com/thuetz/NGPommed"
license=('GPL2')
makedepends=('pkgconfig')
depends=('confuse' 'audiofile' 'pciutils')
conflicts=('pommed' 'pommed-light' 'pommed-git' 'pommed-jalaziz' 'gpomme')
optdepends=('eject: disc ejection support')
source=( "https://github.com/thuetz/NGPommed/archive/v${pkgver}.tar.gz" )
dfname="NGPommed-${pkgver}"
sha256sums=('dcfc915975e8a461ec163e7687dfd1dbc21ebcd61ab13248b4465f17b2615a49')

build() {
  cd ${srcdir}/${dfname}
  make pommed
}

package() {
  install -Dm755 ${srcdir}/${dfname}/source/pommed ${pkgdir}/usr/bin/pommed
  install -Dm644 ${srcdir}/${dfname}/data/pommed.conf.mactel ${pkgdir}/etc/pommed.conf.mactel
  install -Dm644 ${srcdir}/${dfname}/data/pommed.conf.pmac ${pkgdir}/etc/pommed.conf.pmac

  # man page
  install -Dm644 ${srcdir}/${dfname}/data/pommed.1 ${pkgdir}/usr/share/man/man1/pommed.1

  # sounds
  install -Dm644 ${srcdir}/${dfname}/data/goutte.wav ${pkgdir}/usr/share/pommed/goutte.wav
  install -Dm644 ${srcdir}/${dfname}/data/click.wav ${pkgdir}/usr/share/pommed/click.wav

  # systemd
  install -Dm644 ${srcdir}/${dfname}/data/pommed.service ${pkgdir}/usr/lib/systemd/system/pommed.service
}

# vim:set ts=2 sw=2 et:

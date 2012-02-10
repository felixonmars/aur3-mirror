# Maintainer: Francesco Groccia <frgroccia gmail.com>
# Contributor: Xemertix <arch88(at)katamail(dot)com>

pkgname=osiris-sps
pkgver=0.15
pkgrel=2
pkgdesc="An anonymous p2p serverless portal system."
arch=('i686' 'x86_64')
url="http://www.osiris-sps.org/"
license=('custom')
depends=('libjpeg6' 'libpng12')
provides=('osiris-sps')
source=(http://www.osiris-sps.org/repository/osiris_${pkgver}_linux_i386.tar.gz
        'osiris-sps'
        'osiris-sps.desktop'
        'osiris-sps.png'
        'system.xml')
sha256sums=('da625ec733842eeca59697184b1e8a6d39cb7b490c1a2c5f494be37e422ea536'
            'cc1ab7a1bae638f3112636e8c83c84d00a5710aaf15f15b79694d5d7417b958f'
            'f225d2363014749981f91c01a7bf99d385831957027b0cee0155124830047b92'
            '16f68e3d889427c62052ab2213fec19e8a00025bb4dad8f964264c9eb0d49fcf'
            '98e79dce08cc29884d428f17d54b7dac264651c881e46dfd6a09354364b315e8')

if [[ "$CARCH" == "x86_64" ]]; then
  source[0]=http://www.osiris-sps.org/repository/osiris_${pkgver}_linux_x86_64.tar.gz
  sha256sums[0]='1ed7a6ebde432859c8f4d50478275d872e9ec18df9c4ecd56d5e222c73211150'
fi

build() {
  cd $srcdir
  # Link to binary
  install -D -m 755 osiris-sps $pkgdir/usr/bin/osiris-sps

  # Program
  install -d -m 755 ${pkgdir}/opt/${pkgname}/
  cp -r osiris/*  ${pkgdir}/opt/${pkgname}/

  # Config file
  install system.xml ${pkgdir}/opt/${pkgname}/

  # Freedesktop compatibility
  install -D osiris-sps.png ${pkgdir}/usr/share/icons/osiris-sps.png
  install -D osiris-sps.png ${pkgdir}/usr/share/pixmaps/osiris-sps.png
  install -D osiris-sps.desktop ${pkgdir}/usr/share/applications/osiris-sps.desktop

  # Fix permissions
  find "$pkgdir"/opt/ -type f -exec chmod 664 {} +
  find "$pkgdir"/opt/ -type d -exec chmod 755 {} +
  find "$pkgdir"/usr/share -type f -exec chmod 664 {} +
  find "$pkgdir"/usr/share -type d -exec chmod 755 {} +
  chmod 775 $pkgdir/opt/${pkgname}/osiris
}

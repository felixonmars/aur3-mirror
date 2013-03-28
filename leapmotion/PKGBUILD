# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=leapmotion
pkgver=0.7.6
pkgrel=4
pkgdesc="Contact-less human interface"
arch=(i686 x86_64)
url=http://www.leapmotion.com/
license=(custom)
depends=()
makedepends=(libarchive)
provides=(Leap)

if test "$CARCH" == 'x86_64'; then
  source=("Leap-${pkgver}.deb::http://www.dropbox.com/s/sh4hv6bg6l9z8te/Leap-0.7.6-x64.deb"
          'LICENSE'
          'README')
  md5sums=('9be3acd2e0e5a232d98d54f347b2ced6'
           '78a4f0934b105397d1f7b17d06e4717c'
           'c83e295b4225c075e947f739b703063c')
else
  source=("Leap-${pkgver}.deb::http://www.dropbox.com/s/qxfxcsqvhtc773b/Leap-0.7.6-x86.deb"
          'LICENSE'
          'README')
  md5sums=('ef97cdeab4bb6f7ffc393160fd3076f0'
           '78a4f0934b105397d1f7b17d06e4717c'
           'c83e295b4225c075e947f739b703063c')
fi

package(){
  cd "${pkgdir}"

  # Extract binaries
  bsdtar -xf "${srcdir}/Leap-${pkgver}.deb" data.tar.gz
  bsdtar -xf data.tar.gz
  rm data.tar.gz
  chmod -R 755 etc usr

  # LICENSE
  install -D -m644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

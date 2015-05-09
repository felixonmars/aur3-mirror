# Maintainer: Ripper93 <ripper93@cock.li>

pkgname=scangearmp-mg2400
pkgver=2.20
pkgrel=0
pkgdesc="Canon Scanner Driver For MG-2400"
arch=('i686' 'x86_64')
url="http://support-au.canon.com.au/contents/AU/EN/0100469601.html"
license=('unknown')
depends=('cnijfilter-common-mg2400' 'cnijfilter-mg2400series')
makedepends=('rpmextract')
source=("http://gdlp01.c-wss.com/gds/6/0100005516/01/scangearmp-mg2400series-2.20-1-rpm.tar.gz")
md5sums=('64b121787f7d016d06f996256a13214d')

package() {
  if [ "${CARCH}" = 'x86_64' ]; then
    rpmfile=$(find "$srcdir" -name scangearmp-mg2400series-$pkgver*${CARCH}*.rpm)
  elif [ "${CARCH}" = 'i686' ]; then
    rpmfile=$(find "$srcdir" -name scangearmp-mg2400series-$pkgver*i386*.rpm)
  fi
  cd $pkgdir
  rpmextract.sh $rpmfile
}

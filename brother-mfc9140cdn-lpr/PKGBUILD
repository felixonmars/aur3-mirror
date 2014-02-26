# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=brother-mfc9140cdn-lpr
_printer=mfc9140cdn
pkgver=1.1.2_1
pkgrel=1
pkgdesc="LPR driver for Brother MFC-9140CDN multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public/eu/eu_ot/en/dlf/download_index.html?c=eu_ot&lang=en&prod=mfc9140cdn_eu_as_cn&os=128&type2=-1"
license=('custom:Brother_Software_Open_License')
depends=('sh' 'a2ps')
makedepends=('binutils')
optdepends=("brother-$_printer-cupswrapper: For printing via CUPS.")
provides=("$pkgname=${pkgver%_*}")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}lpr-${pkgver/_/-}.i386.deb"
        'license.txt')
md5sums=('ad1d724aff6b62f8e58da1f45bb08c65'
         '7cbb4fe5dde0401c0f45b7a453a66051')

package() {
  cd $srcdir

  # extract the archive
  ar x ${_printer}lpr-${pkgver//_/-}.i386.deb || return 1
  mkdir data
  tar -xzvf data.tar.gz -C data || return 1

  # correct the directory structure
  mkdir -p data/usr/local/brother
  mv data/opt/brother data/usr/local/brother
  mv data/usr/local data/usr/share
  sed -i 's|/opt/brother|/usr/share/brother|g' `grep -lr '/opt/brother' data/` || return 1

  # copy into place
  cp -r data/usr $pkgdir || return 1

  # install the license
  install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1
}

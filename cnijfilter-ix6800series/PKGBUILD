# Contributor: Andrew Ladouceur <andy@drub.ca>
# Based on the PKGBUILD for mg6400 series by Vincenzo Mantova (xworld21)

pkgname=cnijfilter-ix6800series
pkgver=4.10
pkgrel=1
pkgdesc="Canon InkJet Printer Driver (IX6800 Series)"
arch=('i686' 'x86_64')
url="http://www.usa.canon.com/cusa/consumer/products/printers_multifunction/corporate_and_graphic_art_printers/pixma_ix6820"
license=('custom')
depends=('popt')
provides=("cnijfilter-common=$pkgver")
source=(http://gdlp01.c-wss.com/gds/3/0100005863/01/cnijfilter-ix6800series-$pkgver-1-deb.tar.gz)
md5sums=('b0051c8def1014a73469c71f9dae545c')

package() {
  local _pkgarch=$(echo -n "${CARCH}" | sed 's/x86_/amd/' | sed 's/i6/i3/')
  local _debdir="${srcdir}/cnijfilter-ix6800series-${pkgver}-1-deb/packages"

  cd $pkgdir
  ar -x "${_debdir}/cnijfilter-common_${pkgver}-1_${_pkgarch}.deb" "data.tar.gz"
  tar -xzf data.tar.gz && rm -f data.tar.gz

  ar -x "${_debdir}/cnijfilter-ix6800series_${pkgver}-1_${_pkgarch}.deb" \
        "data.tar.gz"
  tar -xzf data.tar.gz && rm -f data.tar.gz

  mkdir -p usr/share/licenses/${pkgname}
  mv usr/share/doc/cnijfilter-common/* usr/share/licenses/${pkgname}
  rmdir usr/share/doc/cnijfilter-common
  mv usr/share/doc/cnijfilter-ix6800series/* usr/share/licenses/${pkgname}
  rmdir usr/share/doc/cnijfilter-ix6800series
  rmdir usr/share/doc

  # Weird permissions error from namcap
  chown root usr/lib/bjlib/cnnet.ini
  chgrp root usr/lib/bjlib/cnnet.ini

  chmod 0755 $(find usr/bin -type f)
  chmod 0755 $(find usr/lib -type f)
  chmod 0644 $(find usr/share -type f)
  chmod 0644 $(find etc -type f)
}


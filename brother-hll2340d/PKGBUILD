# Maintainer: Adrien Thebo <contact@somethingsinistral.net>
pkgname=brother-hll2340d
pkgver=3.2.0_1
pkgrel=1
pkgdesc="Brother HL-L2340D CUPS driver"
url="http://www.brother.com"
arch=('x86_64' 'i686')
depends=('perl' 'bash')
license=('custom:Brother Industries')
source=(
  "http://download.brother.com/welcome/dlf101910/hll2340dlpr-${pkgver//_/-}.i386.rpm"
  "http://download.brother.com/welcome/dlf101911/hll2340dcupswrapper-${pkgver//_/-}.i386.rpm"
)
md5sums=(
  '90ab2e6b0708ad8b23f6911245f9a50f'
  '3c1c19e4ffbfa2adb42e5eea3776e376'
)

if [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-glibc')
fi

package() {
  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/opt/brother" "${pkgdir}/opt/brother"

  mkdir -p "${pkgdir}/usr/lib/cups/filter"
  echo "#! /opt/brother/Printers/HLL2340D/cupswrapper/brother_lpdwrapper_HLL2340D" > "${srcdir}/filter-shim"
  install -m 0755 -o root -g root "${srcdir}/filter-shim" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_HLL2340D"

  mkdir -p "${pkgdir}/usr/share/ppd/cupsfilters"
  install -m 0644 -o root -g root "${srcdir}/opt/brother/Printers/HLL2340D/cupswrapper/brother-HLL2340D-cups-en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters"
}


# vim:set ts=2 sw=2 et:

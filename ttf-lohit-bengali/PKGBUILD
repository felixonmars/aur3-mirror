# Contributor: Ananda Samaddar <ananda.samaddar@zoho.com>

pkgname=ttf-lohit-bengali
pkgver=2.91.2
pkgrel=1
pkgdesc="Indic TrueType fonts from Fedora Project"
arch=('any')
url="https://fedorahosted.org/lohit/"
license=('custom: OFL')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(OFL.license
  https://fedorahosted.org/releases/l/o/lohit-bengali-ttf-$pkgver.tar.gz)

package() {
  install -d "${pkgdir}"/usr/share/fonts/TTF
  install -d "${pkgdir}"/etc/fonts/{conf.avail,conf.d}

  install -m644 "${srcdir}"/*/*.conf "${pkgdir}/etc/fonts/conf.avail/"
  install -m644 "${srcdir}"/*/*.ttf  "${pkgdir}/usr/share/fonts/TTF/"

  cd "${pkgdir}/etc/fonts/conf.d"
  for config in ../conf.avail/*.conf; do
    ln -s ${config} .
  done

  install -D -m644 "${srcdir}/OFL.license" \
    "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
}

sha256sums=('ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3'
	    '575f04a9f135b9b070c8c4b64f686dc4ca01f4fee1ede7abe3f1a49a5676a58c')

# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=thunderbird-lightning-alien-armv7h
pkgdesc="Lightning brings the Sunbird calendar to the popular email client Mozilla Thunderbird on armv7h. Alien package taken from Fedora Core 18 binaries."
pkgver=1.9.1
pkgrel=1
_tbver=17.0.8
_tbid='{3550f703-e582-4d05-9a08-453d09bdfdc6}'
_lightning_id='{e2fda1a4-762b-4020-b5ad-a41df1933103}'
_google_provider_id='{a62ef8ec-5fdc-40c2-873c-223b8a6925cc}'
_fpkgname=thunderbird-lightning
_fver=1.9.1
_frel=2.fc18
_farch=armv7hl

arch=('armv7h')
url="http://www.mozilla.org/projects/calendar/"
license=('MPL' 'GPL' 'LGPL')
depends=("thunderbird>=${_tbver}")
makedepends=('rpmextract')
provides=("lightning=${pkgver}")
source=("http://arm.koji.fedoraproject.org/packages/${_fpkgname}/${pkgver}/${_frel}/${_farch}/${_fpkgname}-${_fver}-${_frel}.${_farch}.rpm")

md5sums=('a2c05de8826abdea747ac11613a92f81')

build() {
  cd "${srcdir}/"
  # extract the rpm archive
  rpmextract.sh ${_fpkgname}-${_fver}-${_frel}.${_farch}.rpm
}

package() {
  cd "${srcdir}/"
  mkdir -p "${pkgdir}/usr/lib/mozilla/extensions/${_tbid}"
  cp -dr --preserve=mode,timestamp "${srcdir}/usr/lib/mozilla/extensions/${_tbid}/${_lightning_id}" "${pkgdir}/usr/lib/mozilla/extensions/${_tbid}/"
  cp -dr --preserve=mode,timestamp "${srcdir}/usr/lib/mozilla/extensions/${_tbid}/${_google_provider_id}" "${pkgdir}/usr/lib/mozilla/extensions/${_tbid}/"
  mkdir -p "${pkgdir}/usr/share/doc/${_fpkgname}-${_fver}/"
  cp -dr --preserve=mode,timestamp "${srcdir}/usr/share/doc/${_fpkgname}-${_fver}"/* "${pkgdir}/usr/share/doc/${_fpkgname}-${_fver}/"
}


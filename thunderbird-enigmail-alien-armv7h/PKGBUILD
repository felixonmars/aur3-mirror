# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=thunderbird-enigmail-alien-armv7h
pkgdesc="OpenPGP email security for Mozilla Thunderbird on armv7h. Alien package taken from Fedora Core 18 binaries."
pkgver=1.5.2
pkgrel=1
_tbver=17.0.8
_tbid='{3550f703-e582-4d05-9a08-453d09bdfdc6}'
_extension_id='{847b3a00-7ab1-11d4-8f02-006008948af5}'
_fpkgname=thunderbird-enigmail
_fver=1.5.2
_frel=1
_fcore=fc18
_farch=armv7hl

arch=('armv7h')
url="https://www.enigmail.net"
license=('MPL' 'GPL')
depends=("thunderbird>=${_tbver}" 'gnupg' 'pinentry')
makedepends=('rpmextract')
provides=("enigmail=${pkgver}")
source=("http://arm.koji.fedoraproject.org/packages/${_fpkgname}/${pkgver}/1.${_fcore}/${_farch}/${_fpkgname}-${_fver}-${_frel}.${_fcore}.${_farch}.rpm")

md5sums=('79cb28e1f34b5e7f981996c9017ee8bb')

build() {
  cd "${srcdir}/"
  # extract the rpm archive
  rpmextract.sh ${_fpkgname}-${_fver}-${_frel}.${_fcore}.${_farch}.rpm
  # replace target platform string
  sed -i 's/Linux_unknown/Linux_/' "usr/lib/mozilla/extensions/${_tbid}/${_extension_id}/install.rdf"
}

package() {
  cd "${srcdir}/"
  mkdir -p "${pkgdir}/usr/lib/mozilla/extensions/${_tbid}"
  cp -dr --preserve=mode,timestamp "${srcdir}/usr/lib/mozilla/extensions/${_tbid}/${_extension_id}" "${pkgdir}/usr/lib/mozilla/extensions/${_tbid}/"
}


# Maintainer: Marco <marcomania at home dot se>

pkgname=kyocera-ta266ci-cups
pkgver=8.1309
pkgrel=1
pkgdesc="PPD driver for Kyocera ECOSYS M2030dn, M2035dn, M2530dn, M2535dn, M6026cdn, M6026cidn, M6526cdn, M6526cidn and TASKalfa 266ci multifunction printer."
url="http://www.kyoceradocumentsolutions.de/index/serviceworld/downloadcenter.false.driver.ECOSYSM6526CDN._.DE.html"
arch=("i686" "x86_64")
license=("nonfree")

depends=("cups")
makedepends=("wget" "unzip")
install="driver.install"

source_filename="Linux_8.1309_EC...idn_TA266ci.zip"
source_path="http://cdn.kyostatics.net/dlc/de/driver/all/linux_8_1309_ecosys.-downloadcenteritem-Single-File.downloadcenteritem.tmp/$source_filename"

build() {

  cd ${srcdir}
  wget "$source_path"
  unzip "$source_filename"

}

install_ppd() {

  local name="$1"
  local lang="$2"

  local newname="${name// /_}_$2"

  mv "$name.PPD" "$newname.ppd"
  gzip "$newname.ppd"
  install -m644 -D "$newname.ppd.gz" "${pkgdir}/usr/share/cups/model/foomatic-db-ppds/Kyocera/$lang/$newname.ppd.gz"

}

package() {

  (
  cd ${srcdir}/Linux/Global/English
  install_ppd "Kyocera ECOSYS M2030dn" en
  install_ppd "Kyocera ECOSYS M2035dn" en
  install_ppd "Kyocera ECOSYS M2530dn" en
  install_ppd "Kyocera ECOSYS M2535dn" en
  install_ppd "Kyocera ECOSYS M6026cdn" en
  install_ppd "Kyocera ECOSYS M6026cdn Type B" en
  install_ppd "Kyocera ECOSYS M6026cidn" en
  install_ppd "Kyocera ECOSYS M6026cidn Type B" en
  install_ppd "Kyocera ECOSYS M6526cdn" en
  install_ppd "Kyocera ECOSYS M6526cdn Type B" en
  install_ppd "Kyocera ECOSYS M6526cidn" en
  install_ppd "Kyocera ECOSYS M6526cidn Type B" en
  install_ppd "Kyocera TASKalfa 266ci" en
  )

  (
  cd ${srcdir}/Linux/Global/German
  install_ppd "Kyocera ECOSYS M2030dn" de
  install_ppd "Kyocera ECOSYS M2035dn" de
  install_ppd "Kyocera ECOSYS M2530dn" de
  install_ppd "Kyocera ECOSYS M2535dn" de
  install_ppd "Kyocera ECOSYS M6026cdn" de
  install_ppd "Kyocera ECOSYS M6026cdn Type B" de
  install_ppd "Kyocera ECOSYS M6026cidn" de
  install_ppd "Kyocera ECOSYS M6026cidn Type B" de
  install_ppd "Kyocera ECOSYS M6526cdn" de
  install_ppd "Kyocera ECOSYS M6526cdn Type B" de
  install_ppd "Kyocera ECOSYS M6526cidn" de
  install_ppd "Kyocera ECOSYS M6526cidn Type B" de
  install_ppd "Kyocera TASKalfa 266ci" de
  )

  (
  cd ${srcdir}/Linux/Global/French
  install_ppd "Kyocera ECOSYS M2030dn" fr
  install_ppd "Kyocera ECOSYS M2035dn" fr
  install_ppd "Kyocera ECOSYS M2530dn" fr
  install_ppd "Kyocera ECOSYS M2535dn" fr
  install_ppd "Kyocera ECOSYS M6026cdn" fr
  install_ppd "Kyocera ECOSYS M6026cdn Type B" fr
  install_ppd "Kyocera ECOSYS M6026cidn" fr
  install_ppd "Kyocera ECOSYS M6026cidn Type B" fr
  install_ppd "Kyocera ECOSYS M6526cdn" fr
  install_ppd "Kyocera ECOSYS M6526cdn Type B" fr
  install_ppd "Kyocera ECOSYS M6526cidn" fr
  install_ppd "Kyocera ECOSYS M6526cidn Type B" fr
  install_ppd "Kyocera TASKalfa 266ci" fr
  )

  (
  cd ${srcdir}/Linux/Global/Italian
  install_ppd "Kyocera ECOSYS M2030dn" it
  install_ppd "Kyocera ECOSYS M2035dn" it
  install_ppd "Kyocera ECOSYS M2530dn" it
  install_ppd "Kyocera ECOSYS M2535dn" it
  install_ppd "Kyocera ECOSYS M6026cdn" it
  install_ppd "Kyocera ECOSYS M6026cdn Type B" it
  install_ppd "Kyocera ECOSYS M6026cidn" it
  install_ppd "Kyocera ECOSYS M6026cidn Type B" it
  install_ppd "Kyocera ECOSYS M6526cdn" it
  install_ppd "Kyocera ECOSYS M6526cdn Type B" it
  install_ppd "Kyocera ECOSYS M6526cidn" it
  install_ppd "Kyocera ECOSYS M6526cidn Type B" it
  install_ppd "Kyocera TASKalfa 266ci" it
  )

  (
  cd ${srcdir}/Linux/Global/Spanish
  install_ppd "Kyocera ECOSYS M2030dn" es
  install_ppd "Kyocera ECOSYS M2035dn" es
  install_ppd "Kyocera ECOSYS M2530dn" es
  install_ppd "Kyocera ECOSYS M2535dn" es
  install_ppd "Kyocera ECOSYS M6026cdn" es
  install_ppd "Kyocera ECOSYS M6026cdn Type B" es
  install_ppd "Kyocera ECOSYS M6026cidn" es
  install_ppd "Kyocera ECOSYS M6026cidn Type B" es
  install_ppd "Kyocera ECOSYS M6526cdn" es
  install_ppd "Kyocera ECOSYS M6526cdn Type B" es
  install_ppd "Kyocera ECOSYS M6526cidn" es
  install_ppd "Kyocera ECOSYS M6526cidn Type B" es
  install_ppd "Kyocera TASKalfa 266ci" es
  )

  (
  cd ${srcdir}/Linux/Global/Portuguese
  install_ppd "Kyocera ECOSYS M2030dn" pt
  install_ppd "Kyocera ECOSYS M2035dn" pt
  install_ppd "Kyocera ECOSYS M2530dn" pt
  install_ppd "Kyocera ECOSYS M2535dn" pt
  install_ppd "Kyocera ECOSYS M6026cdn" pt
  install_ppd "Kyocera ECOSYS M6026cdn Type B" pt
  install_ppd "Kyocera ECOSYS M6026cidn" pt
  install_ppd "Kyocera ECOSYS M6026cidn Type B" pt
  install_ppd "Kyocera ECOSYS M6526cdn" pt
  install_ppd "Kyocera ECOSYS M6526cdn Type B" pt
  install_ppd "Kyocera ECOSYS M6526cidn" pt
  install_ppd "Kyocera ECOSYS M6526cidn Type B" pt
  install_ppd "Kyocera TASKalfa 266ci" pt
  )

}

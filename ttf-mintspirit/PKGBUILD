# Maintainer: Kyla McDonald <kyla.r.mcdonald at gmail dot com>
# Contributor: Dan Serban

pkgname=ttf-mintspirit
pkgver=1.004
pkgrel=1
depends=(fontconfig xorg-font-utils)
pkgdesc="A font made by Arkandis digital foundry and designed by Hirwen HARENDAL"
arch=(any)
license=(custom: OFL 1.1)
url=http://arkandis.tuxfamily.org/
install=ttf-mintspirit.install

build()
{
  wget -O mint_spirit.zip "http://arkandis.tuxfamily.org/fonts/MintSpirit-20120526.zip"
  wget -O OFL.txt "http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=OFL_plaintext&filename=OFL.txt"
  bsdtar -xf mint_spirit.zip
  chmod 644 */*/*.otf
  mkdir -p "${pkgdir}"/usr/share/fonts/TTF
  mkdir -p "${pkgdir}"/usr/share/licenses/ttf-mintspirit
  mv */*/*.otf "${pkgdir}"/usr/share/fonts/TTF/
  mv OFL.txt "${pkgdir}"/usr/share/licenses/ttf-mintspirit/LICENSE
}

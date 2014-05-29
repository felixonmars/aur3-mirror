# Maintainer: Liviu Cristian Mirea-Ghiban <contact at liviucmg dot com>
pkgname=heidisql
pkgver=8.3
pkgrel=1
pkgdesc="A lightweight, Windows based interface for managing MySQL and Microsoft SQL databases. (uses Wine)."
arch=(any)
url="http://www.heidisql.com/"
license=('GPL')
depends=(bash wine)
makedepends=(unzip)
source=("http://www.heidisql.com/downloads/releases/HeidiSQL_${pkgver}_Portable.zip"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('0f0ab322379095b3e4b0bf835ce1f9eb'
         'df3673bc694beceb8ed6cfeace6b6c3f'
         'ea4fc6959a315ef5c2bf8e22c479e22a'
         '29d9a9a8785a035edfa0b30b069e873d')
noextract=("HeidiSQL_${pkgver}_Portable.zip")

package() {
  # Install files from the .zip file
  install -d -m755 ${pkgdir}/usr/share/$pkgname
  unzip "$srcdir/HeidiSQL_${pkgver}_Portable.zip" -d "$srcdir/unzipped"
  cp -ra "$srcdir/unzipped/"* "${pkgdir}/usr/share/${pkgname}"
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;

  # Install the startup script
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install the icon
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install the .desktop
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# Maintainer: Pratik Sinha <pratik@humbug.in>

pkgname=picasa-photo-viewer
pkgver=1.0.3
pkgrel=6
pkgdesc="Use Picasa as a Photo Viewer Application"
arch=('any')
url="http://www.humbug.in/2012/using-picasa-as-a-photo-viewer-in-arch-linux/"
license=('GPL')
depends=('picasa')
provides=("picasa-photo-viewer=${pkgver}")
conflicts=('picasa-photo-viewer')
install=${pkgname}.install
source=("http://unity.humbug.in/files/${pkgname}-${pkgver}.tar.gz")
sha512sums=('425396ad7dfa5af00e927da563bdba1f30ba90df997089a5d84f9de8d98afd077a482f68cbb010a3d9324c062d76637422abed8cd1b1e5d7200ccacac14e7d9e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install Humanity icon theme
  install -Dm644 opt/google/picasa/3.0/wine/drive_c/Program\ Files/Google/Picasa3/runtime/splashPPV.png "${pkgdir}"/opt/google/picasa/3.0/wine/drive_c/Program\ Files/Google/Picasa3/runtime/splashPPV.png
  install -Dm755 usr/bin/PicasaPhotoViewer "${pkgdir}"/usr/bin/PicasaPhotoViewer
  install -Dm644 usr/local/share/applications/PicasaPhotoViewer.desktop "${pkgdir}"/usr/share/applications/PicasaPhotoViewer.desktop
  install -Dm644 usr/local/share/icons/PicasaPhotoViewer.xpm "${pkgdir}"/usr/share/pixmaps/PicasaPhotoViewer.xpm
}

# vim:set ts=2 sw=2 et:

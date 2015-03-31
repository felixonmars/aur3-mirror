# Maintainer: Maciej Żok <maciek.zok@gmail.com>
# Contributor: Florian Krauthan <fkrauthan@gmx.net>
pkgname=toggl-desktop
pkgver=7.1.198
pkgrel=1
pkgdesc="Time tracker application"
arch=("x86_64")
url="http://www.toggl.com/"
license=(custom)
depends=("desktop-file-utils" "hicolor-icon-theme" "libxss" "poco" "qt5-webkit"
         "xdg-utils")
makedepends=("chrpath")
conflicts=("toggl")
replaces=("toggl")
install=${pkgname}.install
source=("http://assets.toggl.com/installers/toggldesktop_7.1.198_amd64.deb"
        "toggl-desktop.install")
sha256sums=("cd874ed926b9952263292a03c37df3fab968c9592ba898410266d7738e720645"
            "774d864ce6e255fc3d329359f81bfeb0448e7c962380632957412f83478147a2")

prepare() {
  cd "${srcdir}"

  msg2 "Extracting files..."
  tar -xf data.tar.gz

  msg2 "Patching insecure rpath..."
  chrpath -d "${srcdir}/opt/toggldesktop/lib/libbugsnag-qt.so.1"

  msg2 "Fixing names..."
  sed -i "s/toggldesktop/toggl-desktop/g" \
    "${srcdir}/usr/share/applications/toggldesktop.desktop"
  find "${srcdir}/usr/share/icons/" -type f -exec \
    rename "toggldesktop.png" "${pkgname}.png" "{}" \;
}

package() {
  cd "${srcdir}"

  msg2 "Installing program..."
  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  install -Dm0755 "${srcdir}/opt/toggldesktop/TogglDesktop" \
    "${pkgdir}/opt/${pkgname}/TogglDesktop"
  install -Dm0755 "${srcdir}/opt/toggldesktop/cacert.pem" \
    "${pkgdir}/opt/${pkgname}/cacert.pem"
  ln -s "/opt/${pkgname}/TogglDesktop" "${pkgdir}/usr/bin/TogglDesktop"

  msg2 "Installing libraries..."
  install -Dm0644 "${srcdir}/opt/toggldesktop/lib/libbugsnag-qt.so.1" \
    "${pkgdir}/opt/${pkgname}/lib/libbugsnag-qt.so.1"
  install -Dm0644 "${srcdir}/opt/toggldesktop/lib/libTogglDesktopLibrary.so.1" \
    "${pkgdir}/opt/${pkgname}/lib/libTogglDesktopLibrary.so.1"

  msg2 "Installing icons..."
  for icon in $(find "${srcdir}/usr/share/icons" -type f;); do
    install -Dm0644 "${icon}" "${pkgdir}/${icon#${srcdir}}"
  done

  msg2 "Installing .desktop file..."
  install -Dm0644 "${srcdir}/usr/share/applications/toggldesktop.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  msg2 "Installing license..."
  install -Dm0755 "${srcdir}/usr/share/doc/toggldesktop/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Tobias Umbach <skoftoby@gmail.com>
pkgname=victoria-park-theme
pkgver=150411
pkgrel=1
pkgdesc="Victoria Park Theme for Openbox, Tint2 and GTK"
arch=("any")
url="http://box-look.org/content/show.php/?content=150411"
license=('None')
source=("http://box-look.org/CONTENT/content-files/150411-vicnew.7z")
sha1sums=("d75f62f5cb4073045ccfec98b3d0858162d1ffe7")

package() {
  install -d "${pkgdir}/usr/share/themes"
  cp -rf "${srcdir}/Victoria Park" "${pkgdir}/usr/share/themes/Victoria-Park"
  # the permissions for some of the files from the 7z are broken, fix them
  find "${pkgdir}/usr/share/themes/Victoria-Park" -type f -exec chmod 644 {} \;
}


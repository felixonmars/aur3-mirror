# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# Needs to be merged with the main putty package. Icon will now show up in freedesktop.org compliant menus.

pkgname=openvas-client-freedesktop
pkgver=1
pkgrel=1
pkgdesc="Icon and .desktop file for OpenVAS-Client"
arch=('any')
license=('GPL')
url=('http://www.openvas.org/')
depends=('openvas-client')
source=('OpenVAS-Client.desktop' 'OpenVAS-Client.xpm')
md5sums=('da8cea6e516d7d61ee37595402b781b6'
         'adf30269fb0121175c016b4e9ccc99e5')
sha1sums=('530d1e69f6846d44aafa5e8af10396c57411bf87'
          'c3df1f9f294d90d35c8857b2a843a23c8908ee61')
package() {
  install -Dm644 "${srcdir}/OpenVAS-Client.desktop" "${pkgdir}/usr/share/applications/OpenVAS-client.desktop"
  install -Dm644 "${srcdir}/OpenVAS-Client.xpm" "${pkgdir}/usr/share/pixmaps/OpenVAS-Client.xpm"
}


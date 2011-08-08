# Contributor: Jens Adam (byte/jra) <j_adam@web.de>

pkgname=mulberry
pkgver=4.0.8
pkgrel=1
pkgdesc="Email, calendar and contact application"
url="http://www.mulberrymail.com/"
license=('custom')
arch=('i686')
depends=('libstdc++5' 'libxft' 'libxpm')
optdepends=('gnupg' 'ispell' 'krb5')
options=('!strip')
source=('http://www.mulberrymail.com/downloads/Mulberry/v4_0_8/Mulberry.tgz'
        'mulberry.desktop')
md5sums=('edf6d196e1ed508d892539a5d6664255'
         'dd5853ae80d81a1c4e15ae3fec66a98b')

package() {
  cd "${srcdir}"
  install -D mulberry "${pkgdir}"/usr/bin/mulberry
  cd .mulberry/Plug-ins
  install -d "${pkgdir}"/usr/lib/mulberry/{Plug-ins/Timezones,Resources}
  install *.so "${pkgdir}"/usr/lib/mulberry/Plug-ins
  install -m644 Timezones/* "${pkgdir}"/usr/lib/mulberry/Plug-ins/Timezones
  install -m644 ../Resources/* "${pkgdir}"/usr/lib/mulberry/Resources
  cd ../..
  install -d "${pkgdir}"/usr/share/{applications,pixmaps,licenses/mulberry}
  install -m644 .mulberry/icons/* "${pkgdir}"/usr/share/pixmaps
  install -m644 mulberry.desktop "${pkgdir}"/usr/share/applications
  install -m644 Mulberry_License "${pkgdir}"/usr/share/licenses/mulberry
}

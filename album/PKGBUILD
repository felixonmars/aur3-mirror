# Contributor: Rafael G. Martins <rafael@rafaelmartins.com>
# Contributor: Firmicus <firmicus āt gmx dōt net>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=album
pkgver=4.08
pkgrel=1
pkgdesc="Perl HTML photo album generator that supports themes"
url="http://marginalhacks.com/Hacks/album/"
arch=('i686' 'x86_64')
license=('custom')
depends=('perl' 'imagemagick')
source=(http://marginalhacks.com/bin/album.versions/${pkgname}-${pkgver}.tar.gz \
        http://marginalhacks.com/bin/album.versions/data-4.05.tar.gz)
md5sums=('f2c321630a8e88a970e1e949fd4119cf'
         '5477cb10ab74f996227aad3012b9ee07')

build() {
  install -d ${pkgdir}/usr/share/album/Themes/ || return 1
  install -d ${pkgdir}/usr/share/album/plugins/ || return 1
  install -d ${pkgdir}/usr/bin/ || return 1
  install -d ${pkgdir}/usr/share/man/man1/ || return 1
  cd ${srcdir}
  cp -r Themes/* ${pkgdir}/usr/share/album/Themes || return 1
  cp -r plugins/* ${pkgdir}/usr/share/album/plugins || return 1
  install -m 755 ${pkgname}-${pkgver}/album ${pkgdir}/usr/bin/album || return 1
  install -D -m 644 License.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
  gzip -c ${pkgname}-${pkgver}/album.1 > ${pkgdir}/usr/share/man/man1/album.1.gz || return 1
  chmod -R 755 ${pkgdir}/usr/share/album/{Themes,plugins}
}


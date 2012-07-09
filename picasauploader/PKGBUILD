# Maintainer: Gadget3000 <gadget3000 at msn dot com>


pkgname=picasauploader
pkgver=0.6.0
pkgrel=1
pkgdesc="A tool to help you upload photos and videos to Google PicasaWeb"
arch=('i686' 'x86_64')
url="http://ivanz.com/projects/picasauploader/"
license=('custom: Copyright (c) 2009 Ivan Zlatev <ivan@ivanz.com>')
depends=('mono')
makedepends=('unzip')
source=(http://cloud.github.com/downloads/ivanz/PicasaUploader/PicasaUploader.zip
	https://github.com/ivanz/PicasaUploader/blob/master/LICENSE.txt)
md5sums=('9f1038e9e42673c6cc780909670242dd'
         '9ab41eacf71d1e24c7c1fe5091b2a4e0')

#build() {
#  true
#}
#
#check() {
# true
#}

package() {
  install -d  ${pkgdir}/usr/share/picasauploader
  install -D ${srcdir}/PicasaUploader/* ${pkgdir}/usr/share/picasauploader/

  install -d ${pkgdir}/usr/share/licenses/picasauploader
  install -D -m644 ${srcdir}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d ${pkgdir}/usr/bin
  echo \#\!/bin/bash > ${pkgdir}/usr/bin/picasauploader
  echo cd /usr/share/picasauploader >> ${pkgdir}/usr/bin/picasauploader
  echo mono PicasaUploader.exe >> ${pkgdir}/usr/bin/picasauploader
  chmod +x ${pkgdir}/usr/bin/picasauploader
}

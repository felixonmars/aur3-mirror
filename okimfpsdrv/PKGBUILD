# Maintainer: Brecht Machiels <brecht[at]mos6581[dot]org>
pkgname=okimfpsdrv
pkgver=1.1.3
pkgrel=1
pkgdesc="Oki MFP Scanner Driver"
url="http://www.okidata.com"
arch=('x86_64')
license=('Oki Data Corporation License')
depends=('sane' 'libusb' 'python2')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install='okimfpsdrv.install'
source=("Debian_AMD64_113_tcm3-156522.zip::http://belgium.oki.com/Includes/Pages/FileDownload.aspx?id=tcm:125-156526"
        "okiscand.service")
md5sums=('119e1c36dc3a43cd519cec217c664e5d'
         'b7ded9bffb4944c5d9dac6251587d670')

build() {
  cd "${srcdir}"
  ar x okimfpsdrv_1.1.3_amd64.deb
  tar xf data.tar.gz

  rm -r etc/sane.d
  sed -i 's/^#!\/usr\/bin\/\(env \|\)python/#!\/usr\/bin\/\1python2/' usr/libexec/okimfputl/*.py
  sed -i 's/^#!\/usr\/bin\/\(env \|\)python/#!\/usr\/bin\/\1python2/' usr/libexec/okimfpdrv/*.py
}

package() {
  cd "${srcdir}"
  cp -R $srcdir/etc $pkgdir/etc
  cp -R $srcdir/usr $pkgdir/usr
  mkdir -p $pkgdir/etc/systemd/system
  cp $startdir/okiscand.service $pkgdir/etc/systemd/system
}

# vim:set ts=2 sw=2 et:

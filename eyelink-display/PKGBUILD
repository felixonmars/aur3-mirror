# Maintainer: Poco <poco@atelo.org>

pkgname=eyelink-display
pkgver=1.9
pkgrel=1
pkgdesc="Library for the EyeLink eye tracker"
arch=('x86_64')
license=('custom')

source=("http://download.sr-support.com/linuxDisplaySoftwareRelease/EyeLinkDisplaySoftware${pkgver}_x64.tar.gz"
	"LICENSE")
url="http://www.sr-research.com"

md5sums=('3ca00be2d9f8cf72c27513e69963368b'
         '752d5199c92251e7cb9ac36922af3070')

build() {
  install -d ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -D -m644 ${startdir}/LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/

  mv ${srcdir}/linuxinstall/{bin,include,lib} ${pkgdir}/usr/
}

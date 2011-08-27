# Contributor: Nevar <psi.neamf@gmail.com>
pkgname=realbasic
pkgver=2007r5
pkgrel=1
pkgdesc="A RAD environment that compiles native applications for Windows, Mac and Linux."
arch=('i686')
url="http://www.realsoftware.com"
license=('custom')
depends=('gtk2')
install=('realbasic.install')
source=(http://realsoftware.cachefly.net/REALbasic{$pkgver}/REALbasicLinux.tgz realbasic.install realbasic.desktop)
md5sums=('137fb93d13d8a510dfe9d6e3e9521c38'
         '40c6a2bfd97c277bb5c356c53fe1e932'
         'f50de62bde7e09c81b6dd0179a93549d')

build() {
	
  chmod 755 -R ${startdir}/src/REALbasic${pkgver}

  mkdir -p ${startdir}/pkg/opt/RealBasic-${pkgver}
  mv ${startdir}/src/REALbasic${pkgver}/* ${startdir}/pkg/opt/RealBasic-${pkgver}

  install -D -m644 ${startdir}/pkg/opt/RealBasic-${pkgver}/Resources/icon.xpm ${startdir}/pkg/usr/share/pixmaps/realbasic.xpm
  install -D -m644 ${startdir}/pkg/opt/RealBasic-${pkgver}/Documentation/License\ Agreement.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
  install -D -m644 ${startdir}/src/realbasic.desktop ${startdir}/pkg/usr/share/applications/realbasic.desktop

  mkdir -p ${startdir}/pkg/usr/bin
  ln -sf /opt/RealBasic-${pkgver}/REALbasic2007 ${startdir}/pkg/usr/bin/RealBasic 
}

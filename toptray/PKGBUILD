pkgname=toptray
pkgver=0.1
pkgrel=2
pkgdesc="Wifi assistant for Politecnico di Torino"
arch=(i686 x86_64)
depends=('python' 'wxpython')
license=('GPL')
url="http://www.labinf.polito.it/whitone/toptray/"
source=(
  'http://www.labinf.polito.it/whitone/soft/TOPTray/0.1/TOPTray-0.1.tar.bz2'
  'install.patch')

md5sums=('38f021f1b854cf657f5f21d967432149'
	 '7d299328d03e19197d43d9d465377ae0')

build() {
  cd ${srcdir} ; patch < install.patch
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/TOPTray.py ${pkgdir}/usr/bin/toptray
  mkdir -p ${pkgdir}/usr/share/{doc,pixmaps,}/toptray
  cp ${srcdir}/LICENSE ${pkgdir}/usr/share/doc/toptray/
  cp ${srcdir}/TOPTray.png ${pkgdir}/usr/share/pixmaps/toptray/
  cp ${srcdir}/FormParser.py ${pkgdir}/usr/share/toptray/
  cp ${srcdir}/SetupWizard.py ${pkgdir}/usr/share/toptray/
  cp ${srcdir}/SimpleConfig.py ${pkgdir}/usr/share/toptray/
  cp ${srcdir}/VernierAuthentication.py ${pkgdir}/usr/share/toptray/
  mkdir -p ${pkgdir}/usr/share/{python-support,applications}
  echo '/usr/share/toptray' > ${pkgdir}/usr/share/python-support/toptray.dirs
  cp ${srcdir}/TOPTray.desktop ${pkgdir}/usr/share/applications/
}

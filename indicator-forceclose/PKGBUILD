# Maintainer: Aaron Abbott <aaron.abbott1@gmail.com>
pkgname=indicator-forceclose
pkgver=12.02
pkgrel=1
_pkgrel_ubuntu=1
pkgdesc="AppIndicator used to force close an application for Unity Shell and possible other DE's"
arch=('any')
url="https://launchpad.net/indicator-forceclose"
license=('GPL3')
depends=('python2' 'libappindicator3' 'libappindicator' 'xorg-xkill')
source=("https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}_${pkgver}.${_pkgrel_ubuntu}.tar.gz"
		'indicator-forceclose.desktop' 
		'gnome-panel-force-quit.svg')
md5sums=('9ae84f315b16f5c4a10399ff1891cfe8'
         '4e46f6152fdec09c90e643b4ae72bb49'
         'dc69ba61c1d81804206948c909e32499')

build() {
  cd ${srcdir}
  tar -xzvf ${pkgname}_${pkgver}.${_pkgrel_ubuntu}.tar.gz &> /dev/null
  cd ${srcdir}/${pkgname}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}
  python2 setup.py install --root="${pkgdir}" --prefix="/usr"
  chmod 700 ${pkgdir}/home/aaron/.config
  install -d ${pkgdir}/usr/share/applications
  install -m 644 ${srcdir}/indicator-forceclose.desktop ${pkgdir}/usr/share/applications
  
  if ! [ -a /usr/share/icons/hicolor/scalable/apps/gnome-panel-force-quit.svg ]
  then
	install -d ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
	install -m 644 ${srcdir}/gnome-panel-force-quit.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
  fi
}

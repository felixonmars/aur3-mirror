pkgname=fontconfig-ms-fonts-zh
pkgver=1.0
pkgrel=1
pkgdesc="Font configuration using ttf-ms-fonts-zh"
url="http://www.archlinux.org/"
arch=('any')
license=('bsd')
depends=('fontconfig' 'ttf-ms-fonts-zh')
provides=()
source=(18-ttf-ms-fonts-zh-common.conf 26-ttf-ms-fonts-zh.conf 48-ttf-ms-fonts-zh-local.conf)
install=fontsconf.install

build() {
  cd ${startdir}
  msg "Install configure files..."
  for i in ${srcdir}/{18,26,48}-*; do
    install -Dm644 $i ${pkgdir}/etc/fonts/conf.avail/`basename $i`
  done
  
  install -d ${pkgdir}/etc/fonts/conf.d/
  cd ${pkgdir}/etc/fonts/conf.d/
  ln -sf ../conf.avail/18-ttf-ms-fonts-zh-common.conf .
  ln -sf ../conf.avail/26-ttf-ms-fonts-zh.conf .
  ln -sf ../conf.avail/48-ttf-ms-fonts-zh-local.conf .
}

md5sums=('d6888c3bb03956a1a954b3f73c79b938'
	 '98f40b26df7874b789cd78a538173b9b'
	 '2c12a9c0569740f3058e6fa35daf5ccf')

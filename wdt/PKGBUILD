# Syco <SycoLTH at gmail dot com>
# Lê Quốc Tuấn <mr.lequoctuan AT gmail DOT com>

pkgname=wdt
pkgver=2.6.6
pkgrel=ppa0
pkgdesc="Web Developer Tools is a suite of useful tools for web developers"
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/WDT+-+Web+Developer+Tools?content=129726"
license=('GPL')
depends=('python>=2.4' 'pygtk' 'vte' 'pywebkitgtk' 'python-imaging'
  'python-feedparser' 'python-notify' 'optipng>=0.6.2.1'
  'advancecomp>=1.15' 'wget' 'mysql-clients' 'gzip' 'bzip2' 'lftp' 'gnome-menus')
source=(https://launchpad.net/~petrakis/+archive/wdt-main/+files/${pkgname}_${pkgver}~${pkgrel}_all.deb)
md5sums=('701c974ccbc22eed710cd89d648dada1')

build () {
  ar x ${pkgname}_${pkgver}~${pkgrel}_all.deb
  tar xzf data.tar.gz -C ${pkgdir}
  sed -i 's/^python /python2 /' ${pkgdir}/usr/bin/wdt
  find ${pkgdir} -name '*.py' -exec sed -i -r 's/(^#!.+)python$/\1python2/' {} \;
}

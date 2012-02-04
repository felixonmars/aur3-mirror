# Contributor: ugaciaka <ugaciaka@gmail.com>

pkgname=sd_agent
pkgver=1.4.1
pkgrel=1
pkgdesc="Monitor CPU load, memory, processes, disk usage, network traffic, Apache, MySQL & Nginx"
url="http://www.serverdensity.com"
arch=('any')
backup=('etc/sd-agent/config.cfg')
license=('BSD & GPL')
source=('http://www.serverdensity.com/downloads/sd-agent.tar.gz' 'agent.patch' 'sd-agent.init')
md5sums=('34e09005c4512f9fc33ae2201f5d4936' '94133e7298fb82ccac419bb93382e2a2' '7ed983eb4a5cc7e9ae9bdb9ba0fca1c5')
depends=('python>=2.6')
optdepends=('mysql, apache2, nginx: for not free service')
install=(sd-agent.install)

build()
{
  cd $srcdir/sd-agent
  patch -Np0 -i $srcdir/agent.patch || return 1

  mkdir -p $pkgdir/etc/{rc.d,sd-agent}
  mkdir -p $pkgdir/usr/bin/sd-agent

  install -m755 $srcdir/sd-agent.init $pkgdir/etc/rc.d/sd-agent
  rm sd-agent.init

  install -m644 config.cfg $pkgdir/etc/sd-agent/config.cfg
  rm config.cfg

  # not necessary with python 2.6
  rm LICENSE-minjson minjson.py

  cp *.py $pkgdir/usr/bin/sd-agent
  cp LICENSE $pkgdir/usr/bin/sd-agent

}



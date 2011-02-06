# Contributor: Flamelab <panosfilip@gmail.com>

pkgname=faster-init
_realname=faster
pkgver=0.73
pkgrel=3
pkgdesc="Faster is a script that allows faster boot times."
arch=('any')
url="http://code.google.com/p/faster/"
license=('GPL3')
install=('faster.install')
depends=('daemontools')
backup=('etc/fasterrc')
source=("http://faster.googlecode.com/files/${_realname}-${pkgver}.tar.bz2")
md5sums=('50dc8a337aebfddc76ac4475bf7a64f9')


build() 

{
  cd ${srcdir}/
  if [ -d ${_realname}-build ];then
    rm -r ${_realname}-build
  fi
  cp -r ${_realname} ${_realname}-build
  cd ${_realname}-build
  
  mkdir -p ${pkgdir}/{sbin,etc}
  install -m755 -o root -g root sbin/faster ${pkgdir}/sbin/faster
  sh install/create_config.sh > ${pkgdir}/etc/fasterrc
  install -d -m 0750 -o root -g root ${pkgdir}/var/lib/faster
  tar xvf var/lib/faster/default-devices.tar.bz2 -C ${pkgdir}/var/lib/faster >/dev/null 2>&1
}

# Contributor: Colin Drake <colin.f.drake@gmail.com>
pkgname='fripp-git'
provides='fripp'
pkgver=20090512
pkgrel=2
pkgdesc='A light configurable music playing daemon written in Bash.'
arch=(i686 x86_64)
url='http://github.com/cfdrake/fripp/tree/master'
license='BSD'
makedepends=('git')
source=('fripp.init')
md5sums=('5d3a3f2a3cea22b619eca736005734f4')
install=('fripp.install')
backup=('etc/fripp.conf')

_gitroot='git://github.com/cfdrake/fripp.git'
_gitname='fripp'

build()
{
  cd ${srcdir}
  msg "Connecting to $pkgname GIT server...."

  if [ -d ${srcdir}/$_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/etc/rc.d
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

  cd ${srcdir}/$_gitname/src
  install -m644 fripp ${pkgdir}/usr/bin/fripp || return 1
  chmod +x ${pkgdir}/usr/bin/fripp || return 1
  install -m644 fripp.conf ${pkgdir}/etc/fripp.conf.example || return 1

  cd ..
  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname} || return 1
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1

  cd ..
  install -m775 fripp.init ${pkgdir}/etc/rc.d/fripp || return 1
}

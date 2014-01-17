# Maintainer: Peter Littmann < peter.littmann at gmx dot de >
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=mock-git
_pkgname=mock
pkgver=1.1.35
pkgrel=2
pkgdesc='Mock takes an SRPM and builds RPM packages from it in a chroot'
url='http://fedoraproject.org/wiki/Projects/Mock'
arch=('any')
license=('GPL')
install=mock-git.install
depends=('python2' 'usermode')
makedepends=('git')
checkdepends=('yum>=2.4' 'yum-utils>=1.1.9' 'tar' 'pigz' 'python2-ctypes' 'python2-decoratortools' 'createrepo')
provides=('mock')
conflicts=('mock')
backup=('etc/mock/pam.d/mock' 'etc/mock/security/console.apps/mock')
options=(docs emptydirs)
source=('git://git.fedorahosted.org/git/mock.git')
md5sums=('SKIP')


pkgver() {
  cd ${_pkgname}
  git describe --always | sed -e 's|-|.|g' -e 's|mock.||'
#   git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  
  echo "Need sudo for groupadd -r mock if not already exist"
  getent group mock &>/dev/null || sudo groupadd -r mock
  
  # fix incorrect shebang
  sed -i 's_#!/usr/bin/python_&2_' py/mock.py
  sed -i 's_#!/usr/bin/python_&2_' py/mockchain.py
  sed -i 's_#!/usr/bin/python_&2_' py/mockbuild/mounts.py
}

build() {
  cd ${_pkgname}

  export PYTHON=/usr/bin/python2
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc/mock

  make
}

package() {
  cd ${_pkgname}

  make DESTDIR=${pkgdir} install

  install -d ${pkgdir}/usr/bin
  ln -s /usr/bin/consolehelper ${pkgdir}/usr/bin/mock

  mkdir -p ${pkgdir}/var/{lib,cache}/mock
  chown -R root:mock ${pkgdir}/var/{lib,cache}/mock
  chmod -R 02755 ${pkgdir}/var/{lib,cache}/mock
}

check() {
  cd ${_pkgname}
  export LANG=C
  export LC_ALL=C
  # may be better to use user=mockbuild and group=mockbuild at least on el
  # do not abort on error as some sems to be "expected"
  [[ $CARCH == "x86_64" ]] && make -k check || true
}
# PKGBUILD Maintainer: Walter Dworak <preparationh67@gmail.com>
pkgname=mininet-git
pkgver=2.1
pkgrel=0
pkgdesc="Mininet network emulator"
url="https://github.com/mininet/mininet/"
arch=('x86_64' 'i686')
license=('custom')
makedepends=('help2man')
depends=('bash' 'python2' 'python2-networkx' 'net-tools' 'iputils' 'iperf')
optdepends=('openvswitch')
conflicts=()
replaces=()
backup=()

_gitroot="https://github.com/mininet/mininet.git"
_gitname="mininet"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
    if [ -d $_gitname ] ; then
    ( cd $_gitname && git pull ) || warning "Git pull failed!"
  else
    git clone --depth=1 $_gitroot 
  fi
  msg "GIT checkout done or server timeout"

  cd $_gitname
  grep python2 Makefile && return
  grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:g'
  grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/python:#!/usr/bin/python2:g'
  sed 's:BINDIR = /usr/bin:BINDIR = $(DESTDIR)/usr/bin:g' -i Makefile
  sed 's:MANDIR = /usr/share/man/man1:MANDIR = $(DESTDIR)/usr/share/man/man1:g' -i Makefile
  sed 's:install $(MNEXEC) $(BINDIR):mkdir -p $(BINDIR); install $(MNEXEC) $(BINDIR):g' -i Makefile
  sed 's:install $(MANPAGES) $(MANDIR):mkdir -p $(MANDIR);install $(MANPAGES) $(MANDIR):g' -i Makefile
  sed 's:python setup.py:python2 setup.py install --prefix=/usr --root="$(DESTDIR)" --optimize=1:g' -i Makefile

}
 
package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" install
}

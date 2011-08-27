# Contributor: Tomasz Kontusz <roverorna@gmail.com>

pkgname=sasc-ng
pkgver=182
pkgrel=1
pkgdesc="SASC-NG is SoftCAM creating virtual DVB interface"
url="https://opensvn.csie.org/traccgi/sascng/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kernel-headers')
makedepends=('subversion')
#conflicts=()
#provides=()

source=('sasc-ng-linux-2.6.28.patch' 'sasc-ng-parentness.patch' 'sasc-ng.install' 'sasc-ng.rc' 'sasc-ng.conf')
md5sums=()

install='sasc-ng.install'

_svntrunk=http://OpenSVN.csie.org/sascng
_svnmod=sasc-ng

build() {
   cd ${srcdir}

   if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
   else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

   msg "SVN checkout done or server timeout"
   msg "Starting make..."

   cp -r $_svnmod/trunk $_svnmod-build
   cd $_svnmod-build

   patch -p2 < ${srcdir}/sasc-ng-linux-2.6.28.patch
   patch -p2 < ${srcdir}/sasc-ng-parentness.patch
   
   ./configure 
   make module || return 1
   make || return 1

   mkdir -p $startdir/pkg/usr/sbin
   mkdir -p $startdir/pkg/lib/modules/`uname -r`/extra
   mkdir -p $startdir/pkg/etc/{rc.d,conf.d}
   install -m0755 sasc-ng $startdir/pkg/usr/sbin/
   install -m0644 dvbloopback.ko $startdir/pkg/lib/modules/`uname -r`/extra
   install -m0755 ${srcdir}/sasc-ng.rc $startdir/pkg/etc/rc.d/sasc-ng
   install -m0644 ${srcdir}/sasc-ng.conf $startdir/pkg/etc/conf.d/sasc-ng

   rm -rf ${srcdir}/$_svnmod-build
}
# vim:syntax=sh

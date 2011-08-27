# Contributor: Luiz Paulo M. Pires <luizpaulo@myrealbox.com>
# Based on PKGBUILDs from Cainã Costa <sryche@archlinux-br.org> and d'Ronin <daronin@2600.com>
# Use VERSIONPKG to update.

pkgname=zaptel-svn
pkgver=4627
pkgrel=1
pkgdesc="Zaptel Interface Library"
url="http://downloads.digium.com/pub/telephony/zaptel/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
backup=(etc/zaptel.conf)
makedepends=('automake' 'autoconf' 'subversion' 'kernel-headers')
provides=('zaptel=1.4.12.1')
conflicts=()
source=(zaptel.rules zaptel.permissions ztcfg)
md5sums=('9dc01a7567cb55b1ec7a735de0d575f4'
         '90dd920acf53845291b60ae852b6a169'
         '4bfb330e8e0a165e9212c4ad3f6d4eab')
options=()

_svntrunk=http://svn.digium.com/svn/zaptel/branches/1.4/
_svnmod=zaptel-svn

build() {
  cd ${startdir}/src
  msg "Connecting to $_svnmod SVN server...."
  svn co $_svntrunk $_svnmod -r $pkgver
  [ -d ./$_svnmod-build ] && rm -fr ./$_svnmod-build
  cp -r ./$_svnmod ./$_svnmod-build
  cd ./$_svnmod-build
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  #./autogen.sh || return 1
  ./configure  --prefix=/usr --sysconfdir=/etc --exec-prefix=/usr || return 1
  make VERBOSE=1 || return 1
  make DESTDIR=$pkgdir install || return 1
  make DESTDIR=$pkgdir config || return 1

  mkdir -p $pkgdir/usr/bin
  cp {fxotune,ztmonitor,zttest} $pkgdir/usr/bin
  rm -r $pkgdir/etc/udev

  install -D -m644 $startdir/src/zaptel.rules \
         $pkgdir/etc/udev/rules.d/zaptel.rules
  install -D -m644 $startdir/src/zaptel.permissions \
                   $pkgdir/etc/udev/permissions.d/zaptel.permissions
  install -D -m755 ztcfg $pkgdir/sbin/ztcfg
  install -D -m755 $startdir/src/ztcfg \
         $pkgdir/etc/rc.d/ztcfg
}

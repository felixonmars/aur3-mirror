# Maintainer: kane77 <martinhrvn at gmail dot com>
# Adapted/copied from netbeans-cpp-beta 7.0B (Thanks wimvdh)
pkgname=netbeans-java-beta
pkgver=7.1rc1
pkgrel=1
pkgdesc="Netbeans IDE development platform - JavaEE version"
arch=('i686' 'x86_64')
url="http://www.netbeans.org"
license=('CDDL')
depends=('java-environment')
makedepend=('unzip')
conflicts=('netbeans' 'netbeans-beta')
install=netbeans.install
source=(http://dlc.sun.com.edgesuite.net/netbeans/7.1/rc1/zip/netbeans-7.1rc1-201111242103-ml-javaee.zip netbeans.desktop)

md5sums=('1ef840698651cb788aad890990e4a4af'
	'7d6d2b2fc81a461b77c2457e91b274e5')

build() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/netbeans

  rm $srcdir/netbeans/bin/netbeans.exe
  rm -r $srcdir/netbeans/ide/bin/nativeexecution/MacOSX-x86
  rm -r $srcdir/netbeans/ide/bin/nativeexecution/MacOSX-x86_64
  rm -r $srcdir/netbeans/ide/bin/nativeexecution/SunOS-sparc
  rm -r $srcdir/netbeans/ide/bin/nativeexecution/SunOS-sparc_64
  rm -r $srcdir/netbeans/ide/bin/nativeexecution/SunOS-x86
  rm -r $srcdir/netbeans/ide/bin/nativeexecution/SunOS-x86_64
  rm -r $srcdir/netbeans/ide/bin/nativeexecution/Windows-x86
  rm -r $srcdir/netbeans/ide/bin/nativeexecution/Windows-x86_64

  cd $srcdir/netbeans/profiler/lib/deployed/jdk15/
  rm -r hpux-pa_risc2.0 hpux-pa_risc2.0w mac solaris-amd64 solaris-i386 solaris-sparc solaris-sparcv9 windows windows-amd64
  cd $srcdir/netbeans/profiler/lib/deployed/jdk16/
  rm -r hpux-pa_risc2.0 hpux-pa_risc2.0w mac solaris-amd64 solaris-i386 solaris-sparc solaris-sparcv9 windows windows-amd64
  cp -r $srcdir/netbeans/* $pkgdir/usr/share/netbeans/

  install -D -m644 $srcdir/netbeans.desktop $pkgdir/usr/share/applications/netbeans.desktop
  mkdir -p $pkgdir/usr/bin
  ln -s /usr/share/netbeans/bin/netbeans $pkgdir/usr/bin/netbeans
}

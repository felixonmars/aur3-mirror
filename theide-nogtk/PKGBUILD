# Maintainer: Jan Dolinar <dolik.rce@gmail.com>

pkgname=theide-nogtk
pkgver=8227
pkgrel=1
_release=2015.1
pkgdesc="Modern IDE designed for developping large U++/C++ applications (nogtk version)"
arch=('i686' 'x86_64')
url="http://www.ultimatepp.org"
license=('BSD')
groups=()
depends=('libpng' 'gcc-libs' 'libxft' 'desktop-file-utils')
makedepends=()
provides=('theide')
conflicts=('theide')
replaces=()
backup=()
options=(!makeflags emptydirs)
install='theide.install'
source=("http://downloads.sourceforge.net/project/upp/upp/$_release/upp-x11-src-$pkgver.tar.gz"
        "http://upp-mirror.googlecode.com/svn-history/r$pkgver/trunk/uppbox/lpbuild2/mkfile"
        "http://upp-mirror.googlecode.com/svn-history/r$pkgver/trunk/uppbox/lpbuild2/theide.1"
        "http://upp-mirror.googlecode.com/svn-history/r$pkgver/trunk/uppbox/lpbuild2/umk.1"
        'license.txt')
noextract=()

build() {
  cd "$srcdir/upp-x11-src-$pkgver"
  #build
  echo "#define IDE_VERSION \"$pkgver-Arch-$(uname -m)-nogtk\"" > "uppsrc/ide/version.h"
  msg2 "Building $pkgname..."
  _jobs="$(grep -c '^processor' /proc/cpuinfo)"
  make -f "$srcdir/mkfile" PKG=umk FLAGS="GCC" NESTS="uppsrc" TIME= COLOR=0 USEMAINCFG=0 JOBS=$_jobs ECHO=0 TARGET="$srcdir/umk"
  make -f "$srcdir/mkfile" PKG=ide FLAGS="GCC GUI NOGTK" NESTS="uppsrc" TIME= COLOR=0 USEMAINCFG=0 JOBS=$_jobs ECHO=0 TARGET="$srcdir/theide"
}

package(){
  #license
  install -D "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  #man pages
  install -D "$srcdir/theide.1" "$pkgdir/usr/share/man/man1/theide.1"
  install -D "$srcdir/umk.1" "$pkgdir/usr/share/man/man1/umk.1"
  #desktop entry
  install -D "$srcdir/upp-x11-src-$pkgver/uppsrc/ide/theide.desktop" "$pkgdir/usr/share/applications/theide.desktop"
  #icon
  install -D "$srcdir/upp-x11-src-$pkgver/uppsrc/ide/theide-48.png" "$pkgdir/usr/share/pixmaps/theide.png"
  #fix permissions
  find "$pkgdir/usr/" -print0 | xargs -0 chown root:root
  find "$pkgdir/usr/" -type f -print0 | xargs -0 chmod 644
  find "$pkgdir/usr/" -type d -print0 | xargs -0 chmod 755
  #install applications
  install -D "$srcdir/umk" "$pkgdir/usr/bin/umk"
  install -D "$srcdir/theide" "$pkgdir/usr/bin/theide"
}

md5sums=('b4dae8c2cc15699c91a480c6226cf224'
         '9ad99eb6ead298341b6698e505067d7c'
         'b21415926edc5f18efaec625f6135556'
         'b56d54a9d5d722bb32633a06675fbeb6'
         'b214709f096e4f50d61f50988359241e')

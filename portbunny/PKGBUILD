# Contributor: Florian Pritz <f-p@gmx.at>
# Contributor: Martijn F. Arts <mfa@devtty0.de>

pkgname=portbunny
pkgver="050109_dev"
pkgrel=1
pkgdesc="A fast TCP-SYN Linux-kernel-based port-scanner"
arch=('i686' 'x86_64')
url="http://www.recurity-labs.com/portbunny/"
license=('GPL')
depends=('python>=2.4')
makedepends=('make' 'gcc' 'kernel-headers')
install=portbunny.install
source=("http://portbunny.recurity.com/tarballs/PortBunny050109-dev.tar.gz" "installpath.patch" "timespec.patch")
build() {
  cd "$startdir/src/PortBunny050109-dev"
  patch -p1 < $srcdir/installpath.patch
  patch -p1 < $srcdir/timespec.patch
  make || return 1050109_dev
  mkdir -p $startdir/pkg/lib/modules/$(uname -r)/kernel/  $startdir/pkg/usr/share/portbunny || return 1
  mkdir -p $startdir/pkg/usr/bin || return 1
  DESTDIR="$startdir/pkg" make install || return 1
}

# vim:set ts=2 sw=2 et:
md5sums=('792ceed6d20e5035f9dc1fcc318d2bbe'
         'd056310ab5b14b6f859907b6fac7ae5d'
         '42164c0e7d477538074afe942731bb8f')
sha1sums=('829a3c39bc021d81c600899cd4b25de2f01cce32'
          'd765395cda24edea41c66d213b14973a62e88e48'
          'c290f52d41abb64acceae8a1eec84ffac59febe9')
md5sums=('792ceed6d20e5035f9dc1fcc318d2bbe'
         'd056310ab5b14b6f859907b6fac7ae5d'
         '4c1d452b454d78d36ce90f60a6c7ce90')
sha1sums=('829a3c39bc021d81c600899cd4b25de2f01cce32'
          'd765395cda24edea41c66d213b14973a62e88e48'
          '8f4f93aeab397f39e5408d6090d34af73330c09c')

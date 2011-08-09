# GnuPG2 GIT version
# Maintainer: alphazo@gmail.com
# Based on official package maintained by Tobias Powalowski <tpowa@archlinux.org>

pkgname=gnupg2-git
pkgver=20110809
pkgrel=1
pkgdesc="GNU Privacy Guard 2 - a PGP replacement tool. Development version. Do not use in production environments. Test new ECC algorithm by using --expert with --gen-key"
arch=('i686' 'x86_64')
depends=('libldap' 'curl' 'bzip2' 'zlib' 'libksba>=1.2' 'libgpg-error>=1.1' 'libgcrypt>=1.5'
	'pth' 'libusb-compat' 'libassuan>=2.0' 'texinfo' 'readline' 'pinentry')
license=('GPL')
url="http://www.gnupg.org/"
makedepends=('git')
provides=('gnupg2')
conflicts=('gnupg2' 'dirmngr')
replaces=('gnupg2' 'dirmngr')
install=${pkgname}.install

_gitroot="git://git.gnupg.org/gnupg.git"
_gitname="gnupg"


build() {
 # cd ${srcdir}/gnupg-$pkgver
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
     cd $_gitname && git pull origin
     msg "The local files are updated."
   else
     git clone $_gitroot $_gitname
     fi

   msg "GIT checkout done or server timeout"
   msg "Starting make..."

   rm -rf "$srcdir/$_gitname-build"
   git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
   cd "$srcdir/$_gitname-build"
  ./autogen.sh --force
  ./configure --enable-maintainer-mode --prefix=/usr --libexecdir=/usr/lib/gnupg2 #$EXTRAOPTS
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR=${pkgdir} install
  # move conflicting files
  mv ${pkgdir}/usr/share/gnupg{,2}
  rm -f ${pkgdir}/usr/share/info/dir
  # Remove conflicting man file
  rm -f ${pkgdir}/usr/share/man/man7/gnupg.7 
}

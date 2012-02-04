# Maintainer: Joerg Rueppel <joerg@sharky-x.de>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Frane Bandov <frane@offbyte.com>

pkgname=simias
pkgver=3.8.0.3
pkgrel=1
url="http://www.ifolder.com"
arch=('i686' 'x86_64')
pkgdesc="Collection Storage Provider - Basis for iFolders"
options=('!libtool' '!strip')
license=("GPL")
makedepends=('libflaim')
depends=('libxml2' 'log4net')
source=(http://downloads.sourceforge.net/project/ifolder/iFolder%20Clients/$pkgver/simias.tar.gz \
	CSPType.patch flaimwrapper-lib.patch\
	whitelist-home.patch
)

md5sums=('a3b85f8291b25bd3bdeda1b99b6aa2c0'
         '9e1e02ed644cf3437febdf890b9b21a3'
         '5f6e5712550416fd864d8d10281f0257'
         'c206f3b0a613ca25490437eff3040a5a')

build() {
  # this is needed temporarily for the build
  # beware when changing this line.
  # the dir referenced by MONO_SHARED_DIR
  # will be deleted further down
  export MONO_SHARED_DIR=$srcdir/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $srcdir/$pkgname

  # if anything wrong, there are more patches to find
  # here in the suse repository:
  # https://build.opensuse.org/package/files?package=ifolder3&project=network%3Aifolder%3AFactory
  patch -p0 -i ../CSPType.patch
  patch -p0 -i ../flaimwrapper-lib.patch
  patch -p0 -i ../whitelist-home.patch

  # the makefiles don't have proper dependency handling
  export MAKEFLAGS="-j1"

  ./autogen.sh --prefix=/usr --libdir=/usr/lib --libexecdir=/usr/lib/simias --sysconfdir=/etc || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  # remove dir needed for build
  rm -r $MONO_SHARED_DIR
}

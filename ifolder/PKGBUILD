# Maintainer: Joerg Rueppel <joerg@sharky-x.de>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Frane Bandov <frane@offbyte.com>

pkgname=ifolder
pkgver=3.8.0.3
pkgrel=1
arch=('i686 x86_64')
license=("GPL")
pkgdesc="A file sharing solution for workgroup and enterprise environments"
url="http://www.ifolder.com"
options=('!libtool' '!strip')
depends=('gtk-sharp-2' 'simias' 'gnome-sharp' 'xsp')
source=(http://downloads.sourceforge.net/project/ifolder/iFolder%20Clients/$pkgver/ifolder3.tar.gz \
	ifolder-desktop-application.patch
	clientlib-build.patch
	clientapp-build.patch
	ifolder3-libeel.patch
	ifolder3-gtk-deprecated.patch
	README
)
install=$pkgname.install
md5sums=('8325a2497802691597937c6d0d6c20b0'
         '71d5c4f3befc9e994914274772e20e35'
         'f4bdea48e4aa0b86ba084a5f973ef70a'
         'd6295717483d1e082ebfcfc5bae329d6'
         '0ed834aafbd747a3ffd65103b207ad8a'
         '10c4c2c29d31027b5d872b96d7e3f984'
         '32e68e8b7904ab86f88f9e6641dff012')

build() {
  # this is needed temporarily for the build
  # beware when changing this line.
  # the dir referenced by MONO_SHARED_DIR
  # will be deleted further down
  export MONO_SHARED_DIR=$srcdir/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $srcdir/ifolder3

  # if anything wrong, there are more patches to find
  # here in the suse repository:
  # https://build.opensuse.org/package/files?package=ifolder3&project=network%3Aifolder%3AFactory
  patch -p0 -i ../ifolder-desktop-application.patch
  patch -p0 -i ../clientlib-build.patch
  patch -p0 -i ../clientapp-build.patch
  patch -p0 -i ../ifolder3-gtk-deprecated.patch
  patch -p0 -i ../ifolder3-libeel.patch
  
  # poor depsetup in makefiles
  export MAKEFLAGS="-j1"

  ./autogen.sh --sysconfdir=/etc --prefix=/usr --libdir=/usr/lib --libexecdir=/usr/lib/simias

  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$pkgdir install || return 1

  mkdir -p $pkgdir/usr/share/gconf/schemas
  gconf-merge-schema $pkgdir/usr/share/gconf/schemas/ifolder.schemas $pkgdir/etc/gconf/schemas/*.schemas

  # nothing in etc is important for the client
  rm -rf $pkgdir/etc

  # remove dir needed for build
  rm -r $MONO_SHARED_DIR

  # for some reason everything gets built to /usr/lib64 even though libdir and libexecdir are set
  # differently above, so move it and fix references

  if [ "$CARCH" = "x86_64" ]; then
    mv $pkgdir/usr/lib64 $pkgdir/usr/lib
  fi
  sed -i -e 's/lib64/lib/g' $pkgdir/usr/lib/pkgconfig/ifolder3{,-c}.pc
  sed -i -e 's/lib64/lib/g' $pkgdir/usr/bin/{ifolder,KeyRecovery}

  cp $srcdir/README $pkgdir/usr/share/ifolder3
}


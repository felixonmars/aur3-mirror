# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=kencc-hg
pkgver=2007.08.22
pkgrel=2
pkgdesc="A port of the plan9 c-compiler, including its POSIX mode"
arch=('i686')
license=('custom:LPL')
url="http://gsoc.cat-v.org/projects/kencc/"
depends=('plan9port') #altertantive dependency: 9base
makedepends=('mercurial' 'inferno-os' 'unionfs-fuse') #only inferno iar needed, waste...
source=('pccmk.patch' 'libcsumk.patch')
md5sums=('7ebeb83bc1c543b714ad3a467bc57364' 'eea2eb3baedcfdd26e382bf77c05f6c9')

build() {
  cd $srcdir

# Update the repo, else clone a new one
	if [ -d kenc ]; then
		cd kenc
		hg pull -u
		cd $srcdir
	else
		hg clone http://hg.cat-v.org/kenc/
	fi


  PATH=/opt/plan9/bin:/opt/inferno-os/Linux/386/bin/:$PATH export PATH
  PLAN9=/opt/plan9
  MKSHELL=$PLAN9/bin/rc
  LIBDIR=$PLAN9/lib export LIBDIR

  rm -rf $srcdir/build
  cp -ar $srcdir/kenc $srcdir/build
  cd $srcdir/build
  LC_ALL=C mk
}

package() {
  mkdir $pkgdir/opt
  mkdir $pkgdir/opt/plan9
  mkdir $pkgdir/opt/plan9/bin
  rm -rf $srcdir/tmp
  mkdir $srcdir/tmp

  unionfs -o cow -o umask=000 $pkgdir/opt/plan9=RW:/opt/plan9=RO $srcdir/tmp
 
  home=$pkgdir/opt/plan9 export home
  PLAN9=$srcdir/tmp export PLAN9

  patch -p0 $srcdir/build/pcc/mkfile -i $srcdir/pccmk.patch
  patch -p0 $srcdir/build/libcsu/mkfile -i $srcdir/libcsumk.patch

  cd $srcdir/build
  LC_ALL=C mk install
  fusermount -u $srcdir/tmp
  install -Dm644 $srcdir/kenc/LICENCE $pkgdir/usr/share/licences/kencc/LICENCE
}
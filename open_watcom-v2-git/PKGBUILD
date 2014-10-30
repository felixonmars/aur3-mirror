# Mantainer Jens Staal <staal1978@gmail.com>

pkgname=open_watcom-v2-git
pkgver=0.r2155.g22304e6
pkgrel=1
pkgdesc="The Open Watcom C/C++ compiler, github source fork"
arch=('i686' 'x86_64')
url="http://open-watcom.github.io/open-watcom/"
#url="http://www.openwatcom.org"
license=('custom:OWPL-1')

makedepends=('dosbox' 'open_watcom' 'git')
# there are some annoying makepkg-specific bugs in the build
# that makes it required to run the build with watcom
# dosemu should also work, but I hit lots of bugs on x86_64
optdepend=('open_watcom: skip bootstrapping with gcc')
provides=('open_watcom' 'open_watcom-v2' 'openwatcom-extras-hg')
conflicts=('open_watcom' 'open_watcom-v2' 'openwatcom-extras-hg')
replaces=('open_watcom' 'open_watcom-v2' 'openwatcom-extras-hg')

source=('watcom'::'git://github.com/open-watcom/open-watcom-v2.git' 'setvars.sh' \
'owsetenv.sh')
sha256sums=('SKIP' '4ededdb1c0c6412b720dbf137e0b27449a6d15721bb98fe057e3e55613e2be24' \
'44f0b3bff2b722be9cf97b0246cf16d4526fcf6cc09353949ce82552243ccdb8')

options=('!strip' '!buildflags' 'staticlibs')

pkgver() {
  cd $srcdir/watcom/

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
    echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

build() {
  cd $srcdir/watcom
  
  msg "set current source directory and other variables"
  cat $srcdir/setvars.sh | sed "s|CurrentPkgbuildDir|${PWD}|g" > setvars.sh

  #64-bit needs to be built with GCC for now...
  #if [ $CARCH = i686 ]; then
  msg "use OpenWatcom if possible..."
  if [ -d /opt/watcom ]; then
      msg2 "watcom detected"
      sed 's/OWUSENATIVETOOLS=1/OWUSENATIVETOOLS=0/g' -i setvars.sh
  fi
  #else
  #work-around for strange bug in makepkg when building with gcc
  #running build.sh outside of PKGBUILD works...
  #cp $srcdir/*.gh bld/wmake/h/
  #fi
  
  chmod +x build.sh
  source setvars.sh
  msg "OWROOT is $OWROOT" #testing variables from setvars.sh
  msg "OWSRCDIR is $OWSRCDIR" #testing variables from cmnvars.sh
  msg "WATCOM is $WATCOM"
  msg "OWDEFPATH is $OWDEFPATH"
#  ./clean.sh # make sure everything is pristine
  ./build.sh

  cd bld
  builder rel
}


package() {
 cd $srcdir/watcom/rel
 install -d "$pkgdir/usr/share/licenses/watcom"
 install -Dm644 "$srcdir/watcom/license.txt" "$pkgdir/usr/share/licenses/watcom/license.txt"
 mkdir -p $pkgdir/opt/watcom/{binl,lh,h/{dos,win,nt,os2,os21x},lib286/{dos,win,os2},lib386/{nt,os2}}
 cp -ar * $pkgdir/opt/watcom/
 cp $srcdir/owsetenv.sh $pkgdir/opt/watcom/

 msg "adding some fake binaries to make life easier"
 cd $pkgdir/opt/watcom/binl
 ln -s /usr/bin/true ranlib
 ln -s wlib ar
}


# Contributor: buddabrod <buddabrod@gmail.com>

pkgname=compat-wireless-git-old
_kernver=`uname -r`
pkgver=20080916
pkgrel=1
pkgdesc="Backported wireless-testing modules"
url="http://linuxwireless.org"
depends=('kernel26>=2.6.25' 'kernel26<2.6.27')
arch=('i686' 'x86_64')
license=('GPL')
install=$pkgname.install
source=(makefile.patch)

_gitroot="git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/compat-wireless-2.6-old.git"
_gitname="compat-wireless-2.6-old"

md5sums=()
build() {

  cd $startdir/src
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  patch -Np1 -i ../makefile.patch || return 1
  echo -ne "CONFIG_IWL3945_LEDS=y\nCONFIG_IWLWIFI_LEDS=y\nCONFIG_MAC80211_LEDS=y\n" >> config.mk
  make KLIB=/lib/modules/${_kernver} DESTDIR=${startdir}/pkg install || return 1
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
  rm -rf $startdir/src/$_gitname-build
}

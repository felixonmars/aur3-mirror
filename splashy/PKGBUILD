# Maintainer: carstene1ns
# Contributors: Det, Lexiw, Angel "angvp" Velasquez, dongiovanni, Darwin Bautista, Jeremy Sands
#               and some people here: http://bbs.archlinux.org/viewtopic.php?id=48978

pkgname=splashy
pkgver=20130203
pkgrel=2
pkgdesc="A boot splashing system"
arch=(x86_64 i686)
url="http://anonscm.debian.org/gitweb/?p=splashy/splashy.git;a=summary"
license=("GPL")
depends=("mkinitcpio" "sysfsutils" "glib2" "directfb")
makedepends=("automake" "git")
options=("!libtool" "!distcc" "!makeflags")
provides=("splashy")
install=$pkgname.install
backup=("etc/splash.conf"
        "etc/splashy/config.xml")
source=(splashy::git+https://alioth.debian.org/anonscm/git/splashy/splashy.git
        splash.conf
        splash-initscripts
        splashy-functions
        initcpio_hook
        initcpio_install)
sha1sums=('SKIP'
          "7b1f6661665932379032e6d0da430e71ecfc8a45"
          "524d2df3f5d22da814000e68acb37ec8a8475dd3"
          "f6135b85eb336865c3f52d004ee5f4b50409aa0f"
          "300620ed933ac14ce7beb9bfb233ba3d3b2f7627"
          "d99972841c666500f9ffc0ed0e5e93d343a3ae73")

build() {
  cd splashy

  # Fix the build
  sed -e "s|-Werror||g" -i configure.ac
  sed "s|1.10|1.14|g" -i autogen.sh

  ./autogen.sh --prefix=/usr \
               --libdir=/usr/lib \
               --sysconfdir=/etc \
               --sbindir=/sbin \
               --datarootdir=/usr/share \
               --mandir=/usr/share/man \
               --includedir=/usr/include

  make
}

package() {
  cd splashy

  make DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir/"{etc/{console-tools,default,init.d,lsb-base-logging.sh},usr/share/initramfs-tools}

  install -Dm644 ../initcpio_install "$pkgdir"/usr/lib/initcpio/install/splashy
  install -Dm644 ../initcpio_hook "$pkgdir"/usr/lib/initcpio/hooks/splashy
  install -Dm644 ../splashy-functions "$pkgdir"/etc/rc.d/splashy-functions
  install -Dm644 ../splash-initscripts "$pkgdir"/etc/rc.d/functions.d/splash
  install -Dm644 ../splash.conf "$pkgdir"/etc/splash.conf

  sed -e "s|>/etc/splashy/themes<|>/usr/share/splashy/themes<|" -i "$pkgdir"/etc/splashy/config.xml
}

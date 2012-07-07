# Original contributor: v2punkt0 <v2punkt0@gmail.com>
# Contributor: Gilles Bedel <gillou.ray_you.are.a.bot@free.fr>
pkgname=fakeidentd
pkgver=2.6
pkgrel=1
pkgdesc="Concurrent nonforking standalone fake identd"
arch=('i686' 'x86_64')
url="http://www.guru-group.fi/~too/sw/"
license=('GPLv2')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=(etc/conf.d/fakeidentd)
options=()
install=
source=(http://www.guru-group.fi/~too/sw/releases/identd.c
        fakeidentd.rc.d fakeidentd.conf.d)
noextract=()
md5sums=('d26693c1a7c883d1432e05fb6f7ead6e'
         '3b4dca83c630fcce17a19faaf76fd7ec'
         'b0bd7a8b3d5dab034a81603206407ec8')

build() {
  cd $startdir/src/
  sh identd.c TRG=fakeidentd -s -DXXXMULTI $CFLAGS
  install -m755 -D fakeidentd        $startdir/pkg/usr/bin/fakeidentd
  install -m755 -D fakeidentd.rc.d   $startdir/pkg/etc/rc.d/fakeidentd
  install -m644 -D fakeidentd.conf.d $startdir/pkg/etc/conf.d/fakeidentd
}

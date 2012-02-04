# Maintainer : Aaron Griffin <aaron@archlinux.org>
# Contributor: Sorin Ionescu <sorin.ionescu@gmail.com> 
# Contributor: Premysl Janouch <p.janouch@gmail.com>
# Contributor: Stefan Wilkens <stefanwilkens@gmail.com>

pkgname=slim-cursor
_pkgname=slim
pkgver=1.3.2
pkgrel=1
pkgdesc="Simple Login Manager with changeable cursor and other patches"
arch=(i686 x86_64)
url="http://slim.berlios.de"
backup=(etc/slim.conf)
depends=(gcc-libs libxmu libxft libjpeg libpng bash pam)
provides=(slim)
conflicts=(slim)
install=slim.install
license=('GPL2')
source=(http://download.berlios.de/$_pkgname/$_pkgname-$pkgver.tar.gz
        slim slim.logrotate slim.pam slim.patch slim.patch2 slim.patch3
	slim.patch4)
md5sums=('ca1ae6120e6f4b4969f2d6cf94f47b42'
         '07431fcbd753d3abbcfedaa76401e212'
         '257cf53a3f762ff609e2afd265dac953'
         '7f6583f6a6502d76330d1d4b944be5f1'
         '9c0e3c8cee8dc18ca4b100d048ed7431'
         '844a270855532ddb9eed1d10a618e35d'
         '3f280347175d3c120c9c71dea5aec1bf'
         'b2b586cf24f29680c5576e15ac35938a')

build() {
  cd $startdir/src/$_pkgname-$pkgver

  # apply the cursor patch
  patch -p0 < $startdir/src/slim.patch
  # xserver fix -- http://developer.berlios.de/patch/?func=detailpatch&patch_id=2378&group_id=2663
  patch -p1 < $startdir/src/slim.patch2
  # pam_unix2 fix -- http://developer.berlios.de/patch/?func=detailpatch&patch_id=2698&group_id=2663
  patch -p1 < $startdir/src/slim.patch3
  # kerberos fix -- http://developer.berlios.de/patch/?func=detailpatch&patch_id=2690&group_id=2663
  patch -p1 < $startdir/src/slim.patch4
  
  # new libpng fix
  sed -i -e 's/lpng12/lpng14/' \
  -e 's/libpng12/libpng14/' Makefile

  make USE_PAM=1 || return 1
  make DESTDIR=$startdir/pkg install

  install -D -m755 -o root -g root $startdir/src/slim $startdir/pkg/etc/rc.d/slim
  install -D -m644 -o root -g root $startdir/src/slim.logrotate $startdir/pkg/etc/logrotate.d/slim
  install -D -m644 -o root -g root $startdir/src/slim.pam $startdir/pkg/etc/pam.d/slim

  # let's make this a tad safer... "sane defaults" and all
  sed -i "s|#xserver_arguments.*|xserver_arguments   -nolisten tcp vt07|"\
    $startdir/pkg/etc/slim.conf
  # lockfile is defaulted in /var/run, which is not cleared at boot
  # (causes problems) - thanks bogomipz
  sed -i 's|/var/run/slim.lock|/var/lock/slim.lock|' $startdir/pkg/etc/slim.conf
}

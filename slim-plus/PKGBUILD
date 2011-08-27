# $Id$
# Contributor: lh <jarryson#gmail.com>

pkgname=slim-plus
_realname=slim
pkgver=1.3.1
pkgrel=4
pkgdesc="Patched and improved slim."
arch=(i686 x86_64)
url="http://slim.berlios.de"
backup=(etc/slim.conf)
depends=('libxmu' 'libxft' 'libjpeg>=7' 'libpng>=1.4')
provides=(slim)
conflicts=(slim)
install=slim.install
license=('GPL2')
source=(http://download.berlios.de/$_realname/$_realname-$pkgver.tar.gz
        slim
        slim.logrotate
        slim.pam
        slim-1.3.0-custom_keys.diff
        slim-1.3.1-gcc4.4.patch
        slim-no_keyboard.patch
        slim-pam_fix.patch
        slim-restart.patch
        slim.patch
        slim.patch4
        Xsession.sh)
md5sums=('727d0acb24c0fbf0751134c37a9c895f'
         'e3ae7e53a8049d84cb11f5ac299e6552'
         '43da096480bf72c3ccec8ad8400f34f0'
         '183f3068189282f6720f29c9114e150a'
         '46359e01cdebf28eca771ad7c6975edb'
         '90737e34a9b723c0afe800dacf9ff82c'
         'ec140e6abd6780dcd2ce6b3befff0793'
         '3f280347175d3c120c9c71dea5aec1bf'
         '648d871fe7d2a97b7d7b928019e2feee'
         '4f3546f033521847c5235c87184fb3e5'
         'b2b586cf24f29680c5576e15ac35938a'
         'fab2e983184bf82af0a3982b52310312')

build() {
  cd $startdir/src/$_realname-$pkgver
  
  sed -i -e 's/png12/png14/g' Makefile || return 1
  
  msg2 "patch for gcc4.4"
  patch -Np0 -i $srcdir/slim-1.3.1-gcc4.4.patch || return 1
  
  msg2 "Xinerama support"
  # http://developer.berlios.de/patch/?func=detailpatch&patch_id=2697&group_id=2663
  # patch -Np1 -i "$startdir/slim-xinerama.patch" || return 1
  
  msg2 "No keyboard on VC"
  # http://developer.berlios.de/patch/?func=detailpatch&patch_id=2634&group_id=2663
  patch -Np1 -i "$srcdir/slim-no_keyboard.patch" || return 1
  
  msg2 "PAM support fix"
  # http://developer.berlios.de/patch/?func=detailpatch&patch_id=2698&group_id=2663
  patch -Np1 -i "$srcdir/slim-pam_fix.patch" || return 1

  msg2 "Restart Xserver if killed"
  # http://developer.berlios.de/patch/?func=detailpatch&patch_id=2378&group_id=2663
  patch -Np1 -i "$srcdir/slim-restart.patch" || return 1

  msg2 "apply the cursor patch"
  patch -p0 -i $srcdir/slim.patch ||return 1
  
  # kerberos fix -- http://developer.berlios.de/patch/?func=detailpatch&patch_id=2690&group_id=2663
  msg2 "kerberos fix"
  patch -p1 < $srcdir/slim.patch4 ||return 1
  
  msg2 "add optical keys"
  patch -Np1 -i "$srcdir/slim-1.3.0-custom_keys.diff" ||return 1
  
  make USE_PAM=1 || return 1
  make DESTDIR="$pkgdir" MANDIR=/usr/share/man install || return 1

  install -Dm755 "$srcdir/slim" "$pkgdir/etc/rc.d/slim" || return 1
  install -Dm644 "$srcdir/slim.logrotate" "$pkgdir/etc/logrotate.d/slim" || return 1
  install -Dm644 "$srcdir/slim.pam" "$pkgdir/etc/pam.d/slim" || return 1
  install -Dm644 $srcdir/Xsession.sh $pkgdir/etc/X11/Xsession || return 1

  # Provide sane defaults
  sed -i 's|#xserver_arguments.*|xserver_arguments   -nolisten tcp vt07|' \
    "$pkgdir/etc/slim.conf" || return 1
  sed -i 's|/var/run/slim.lock|/var/lock/slim.lock|' "$pkgdir/etc/slim.conf" || return 1
  sed -i 's|-login ~/.xinitrc|-login /etc/X11/Xsession|g' "$pkgdir/etc/slim.conf" || return 1
}

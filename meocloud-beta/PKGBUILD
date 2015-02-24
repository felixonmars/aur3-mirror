# Maintainer: luminoso < luminoso AT gmail DOT com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>

pkgname=meocloud-beta
pkgver=0.2.13beta
pkgrel=1
pkgdesc="Portuguese cloud storage, file synchronization service (with GUI)"
url="https://meocloud.pt"
arch=("i686" "x86_64")
license=('custom')
options=('!strip' '!upx')
conflicts=('meocloud')
depends=('python2-gobject' 'gtk3')
#kdewallet or gnome-keyring daemon must be running
optdepends=('kdeutils-kwalletmanager: authorization control for KDE'
	    'gnome-keyring: authorization contron for GNOME')

case $CARCH in
  i686 )
    md5sums=('2abba4807b1406850a9b86026a4b063e')
    _ARCH=i386 ;;
  x86_64 )
    md5sums=('618176d3a550cbc9e1129dec2e4390b2')
    _ARCH=x86_64 ;;
esac

source=("https://meocloud.pt/binaries/linux/${_ARCH}/meocloud-gui-latest_${_ARCH}_beta.tar.gz")

#md5sums=('0f140b92f21719cc6641b3cb94570d45'
#	 '26788137267c5c7c7e2350811a2547bf') 

package() {
  cp -R $srcdir/{opt,usr} $pkgdir

  find "$pkgdir/opt/meocloud/" -type f -name *.so -exec chmod 755 {} \;
  #find "$pkgdir/opt/meocloud/" -type f -exec chmod 644 {} \;
  chmod 755 $pkgdir/opt/meocloud/gui/meocloud-gui #{daemon,meocloud,meocloudd,restart_meocloud.sh}

#  install -Dm644 "$srcdir/termos.txt" "$pkgdir/usr/share/licenses/$pkgname/termos.txt"

}

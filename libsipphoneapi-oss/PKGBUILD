# Contributor: Severin "gripir" Friede gripir@gripir.de
pkgname=libsipphoneapi-oss
pkgver=0.78.20060112
pkgrel=1
pkgdesc="Libsipphoneapi is required for Gizmo Project to work"
url="http://www.gizmoproject.com/download-linux.html"
depends=('alsa-lib' 'gcc' 'curl')
makedepends=('rpmextract')
source=(http://www.gizmoproject.com/GizmoDownload/libsipphoneapi-oss-0.78.20060112-1.suse.i586.rpm)
md5sums=('4a7489f9cfe93738284a09dc9658c3f7')

build() {
  cd $startdir/pkg/
  rpmextract.sh $startdir/src/libsipphoneapi-oss-0.78.20060112-1.suse.i586.rpm
  chmod 755  $startdir/pkg/usr $startdir/pkg/usr/lib $startdir/pkg/usr/share
}

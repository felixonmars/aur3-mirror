# Contributor: Bernd Prünster <bernd.pruenster@gmail.com>
_pkgname=compiz-fusion-plugins-main
pkgname=compiz-fusion-plugins-main-genie
pkgver=0.8.10
pkgrel=1
pkgdesc="Compiz Fusion Main plugins patched for genie effect (a.k.a. zero-waves magic lamp)"
arch=('i686' 'x86_64')
url="http://blog.northfield.ws/compiz-0-8-10-release-announcement/"
license=('GPL')
install=compiz.install
depends=('compiz-core' 'libjpeg>=7' 'librsvg' 'compiz-bcop' 'libxdamage' 'libxcomposite'
	'libxinerama' 'startup-notification')
makedepends=('intltool' 'pkgconfig' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=(compiz-fusion-plugins-main-git ${_pkgname}=${pkgver})
provides=($_pkgname=$pkgver)
source=(http://www.northfield.ws/projects/compiz/releases/${pkgver}/plugins-main.tar.gz magiclamp.patch)
options=(!libtool)
sha1sums=('64973a098bfc4f3f43cd604202600a551a93ada3' 'ec04c326131a8a91404ee2a552b1b45a46ea18ce')

build() {
  cd "${srcdir}/plugins-main"
  echo "patching magic lamp effect for zero-waves"
  patch -Np0 -i $srcdir/magiclamp.patch
 CPPFLAGS="$CPPFLAGS -I/usr/include/compiz -I/usr/include/startup-notification-1.0 \
        -I/usr/include/libxml2" ./autogen.sh --prefix=/usr --sysconfdir=/etc

  make
}

package() {
  cd "${srcdir}/plugins-main"
  make DESTDIR="${pkgdir}" install
}

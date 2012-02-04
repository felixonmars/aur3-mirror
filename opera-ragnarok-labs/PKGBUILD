# Maintainer: ruario 
pkgname=opera-ragnarok-labs
_bigrelease=11.50
_buildver=24581
pkgver=${_bigrelease}_${_buildver}
pkgrel=2
pkgdesc="A fast and secure web browser and Internet suite. Labs Ragnarök HTML5 parser version."
url="http://labs.opera.com/news/2011/02/22/"
depends=('gcc-libs' 'libxt' 'freetype2' 'libxext')
provides=('opera')
optdepends=('gtk2: GTK integration'
	    'kdebase-runtime: KDE4 integration'
	    'gstreamer0.10-base-plugins: HTML5 open codecs support'
	    'gstreamer0.10-good: HTML5 open codecs support'
	    'gstreamer0.10-ffmpeg: HTML5 not so open codecs support'
	    'gstreamer0.10-bad-plugins: HTML5 not so open codecs support')
install=opera-ragnarok-labs.install
options=(!strip !zipman)
license=('custom:opera')
arch=('i686' 'x86_64')
_arch=i386
[ "$CARCH" = "x86_64" ] && _arch=x86_64
source=(http://snapshot.opera.com/labs/ragnarok/Linux-FreeBSD/opera-${_bigrelease}-${_buildver}.${_arch}.linux.tar.bz2)
md5sums=('eae60759894e082e8e3665f46509265d')
[ "$CARCH" = "x86_64" ] && md5sums=('5b7cce3168929498a6e6eee102a17f88')


package() {
	opera-${_bigrelease}-${_buildver}.${_arch}.linux/install --prefix /usr --suffix ragnarok-labs --repackage "${pkgdir}"/usr
	install -D -m 644 "${pkgdir}"/usr/share/${pkgname}/defaults/license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}

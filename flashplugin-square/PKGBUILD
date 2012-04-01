# Maintainer : pixy <raeonz@gmail.com>
# Contributor: pixy <raeonz@gmail.com>

pkgname=flashplugin-square
pkgver=10.3.162.29
pkgrel=1
pkgdesc='Adobe Flash Player v10 (64-bit) with working HW acceleration'
url='https://blogs.adobe.com/flashplayer/2010/09/flash-player-square.html'
arch=('x86_64')
depends=('mozilla-common' 'libxt' 'gtk2' 'nss' 'curl')
optdepends=('libvdpau: GPU acceleration on Nvidia card')
conflicts=('flashplugin' 'flashplugin-beta')
provides=('flashplayer' 'flashplugin')
license=('custom')
options=(!strip)
install=flashplugin.install
backup=(etc/adobe/mms.cfg)
source=("http://dl.dropbox.com/u/40714120/aur/flashplugin-square/flashplayer10_2_p3_64bit_linux_111710.tar.gz"
	mms.cfg)
md5sums=('49b55c7eb8044453e5f6f2e4b3cb4084'
         '72f226da22b33f0f205a0a93b326292b')

package () {
    cd "$srcdir"
    
    # Directories
    install -d -m755 "${pkgdir}/usr/lib/mozilla/plugins"
    install -d -m755 "${pkgdir}/etc/adobe"
    
    # Files
    install -Dm755 libflashplayer.so "$pkgdir/usr/lib/mozilla/plugins/libflashplayer.so"
    install -Dm644 "$srcdir/mms.cfg" "$pkgdir/etc/adobe/mms.cfg"
}

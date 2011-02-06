# Contributor: twa022 <twa022@gmail.com>

pkgname=thunar-audio-thumbnailer
pkgver=0.1
pkgrel=1
pkgdesc="Audiothumbnailer support for Thunar."
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-thumbnailers/"
license=('GPL2')
arch=('any')
depends=('audiothumbnailer' 'thunar')
install=("$pkgname.install")
source=('audio-thumbnailer'
        'audio-thumbnailer.desktop')

build() {
	cd $srcdir

	mkdir -p ${pkgdir}/usr/lib/xfce4
	mkdir -p ${pkgdir}/usr/share/thumbnailers
	install -m755 audio-thumbnailer ${pkgdir}/usr/lib/xfce4/
	install -m644 audio-thumbnailer.desktop ${pkgdir}/usr/share/thumbnailers/
}

md5sums=('480fe686690c9fd317dff1dea27c0b6b'
         'ba17ab63f1f4a8bd4e0d5040c2053339')

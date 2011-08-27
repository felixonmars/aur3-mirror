# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=ggseq
pkgver=0.3.1
_gg_arch='i386'
pkgrel=1
pkgdesc='GunGirl Sequencer is an easy to use Audiosequencer. It includes a simple Filemanager and uses Drag & Drop to arrange Audiosamples.'
url='http://ggseq.sourceforge.net/'
license='GPL'
arch=('i686')
depends=('jack-audio-connection-kit')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}-${_gg_arch}.tar.gz")
md5sums=('2ebdd4d0bba14d9d3aa589a25732c6f4')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}-${_gg_arch}"

	mkdir -p ${pkgdir}/usr/bin/
	cp ggseq ${pkgdir}/usr/bin/ggseq

	mkdir -p ${pkgdir}/usr/share/icons/
	cp ggseq_32.xpm ${pkgdir}/usr/share/icons/ggseq_32.xpm

	mkdir -p ${pkgdir}/usr/share/applications/
	cp ggseq.desktop ${pkgdir}/usr/share/applications/ggseq.desktop

	#Rights
	chmod -R 755 ${pkgdir}
}

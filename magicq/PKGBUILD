# Maintainer: boltbuckle <amygdala@cheerful.com>

pkgname=magicq
pkgver=1.6.6.8
pkgrel=1
pkgdesc="Lighting Control software. Inclusive MagicVis visualiser & MagicHD media player"
arch=('x86_64')
url="http://www.chamsys.be/"
license=('custom')
depends=(
	'mesa'
	'opencore-amr'
	'ffmpeg-compat'
	'libjpeg-turbo'
	'xcb-util'
	'gst-plugins-base'
	)
optdepends=()
conflicts=()
source=("http://www.chamsys.be/forum/avl/software/magicq_${pkgver}_amd64.deb")
install="magicq.install"
md5sums=('e65a46e6ce4a1247993a675737c47e6c')


package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
	mkdir -m 777 ${pkgdir}/opt/magicq/{log,web,thumbs,backuparchive,convert}
        
        ## To suppress update and reinstall warnings about different file permissions between
        ## filesystem and package	
        chmod 777 ${pkgdir}/opt/magicq/
        chmod -R 777 ${pkgdir}/opt/magicq/{show,audio}
	}


# Contributor: Jozef Riha <jose1711 at gmail dot com>
# Updated by Harald Bongen, changed to branded software

pkgname=rewe-fotobuch
pkgver=5.1.7
pkgrel=1
pkgdesc="an offline client for creating photobooks, uploading and ordering them at cewe.de labeld by REWE"
url="http://www.cewe.de/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget' 'unzip')
arch=('i686' 'x86_64')
source=("http://dls.photoprintit.com/download/Data/3163/hps/setup_REWE_Fotoservice.tgz" "rewe-fotobuch.desktop")
install=rewe-fotobuch.install
md5sums=('ddc0d9a9fa854f42b8db8f949c171883' 'a142aa2fcd2f9d15d1809f1fe2009ebc')

_KEYACCID=16523
_CLIENTID=18


build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/{share/$pkgname,bin}
#	# download list of links
#	wget -O url_list.txt "http://dls.photoprintit.de/download/Data/${_KEYACCID}/hps/${_CLIENTID}-index-$pkgver.txt" || return 1
#	echo "Downloading and extracting files.."
#	for url in $(awk -F\; '{print $1}' url_list.txt|egrep -v "dll|cewe|setup_Mueller|setup_Fotostar|setup_Meine_CeWe_Fotowelt_de|setup_Moj_CeWe"); do
#		wget "http://dls.photoprintit.de/$url" || return 1
#		unzip -o -d $srcdir $(basename $url) || return 1
#	done
	./install.pl --installDir=$pkgdir/usr/share/rewe-fotobuch --workingDir=$srcdir -k -v
#	# copy EULA
#	install -D -m644 $srcdir/EULA.txt $pkgdir/usr/share/$pkgname/EULA.txt || return 1
        # create startup script
        (echo "#!/bin/bash
cd /usr/share/$pkgname
./rewe-fotobuch \"\$@\"") > $pkgdir/usr/bin/rewe-fotobuch
        chmod 755 $pkgdir/usr/bin/rewe-fotobuch
        # utf-8 and space in executable filenames is generally a bad idea
	cd $pkgdir/usr/share/$pkgname
        mv "REWE Fotoservice" "rewe-fotobuch"
	# create desktop shortcut
	install -D -m644 $pkgdir/usr/share/$pkgname/Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/rewe-fotobuch.xpm && \
	install -D -m644 $srcdir/rewe-fotobuch.desktop $pkgdir/usr/share/applications/rewe-fotobuch.desktop || return 1
}

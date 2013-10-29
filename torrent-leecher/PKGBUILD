# Maintainer: Olli Laasonen <admin at laasonen dot net>

pkgname=torrent-leecher
pkgver=0.3.6
pkgrel=1
pkgdesc="A daemon/proxy for BitTorrent clients that manipulates traffic statistics sent to the tracker. Remember to seed!"
url="http://aur.archlinux.org/packages.php?ID=41390"
install="torrent-leecher.install"
arch=('any')
license=('AGPL')
depends=('python' 'systemd')
backup=('etc/torrent-leecher.conf')
source=(Configs.py
	DataUnits.py
	HttpClient.py
	HttpServer.py
	Logs.py
	Main.py
	Manipulator.py
	run
	torrent-leecher.conf
	torrent-leecher-logs
	torrent-leecher.service
)

md5sums=('23ada9475fcd755014b6b127f9537bcb'
	'aff859724da6f53a24e0439d00f8c41a'
	'f2b960d24efe231a435a083d190af2e5'
	'81e24a7b6b5e7c178e82f16a8dc71898'
	'76fd9cc1201988c7d7195af5b4ad96c4'
	'577f40285655f5c15e20c93292564059'
	'ce327d7e9e2c1b6c326dfbc6bdbe100b'
	'd2e1394d0615a99d3a5cfa73b52b8a1a'
	'a956703dfd9c1a76ddd5c0b1030d4a87'
	'5dbcb2fd200a816ee29f63086c13f747'
	'9b2df023b0e6da6da53d91f51450533d'
)
build(){
	if [ -a $srcdir/$pkgname-$pkgver ]
	then
		echo "Deleting old build folder.."
		rm -R $srcdir/$pkgname-$pkgver
		echo ""
	fi
	echo "Preparing files.."
	chmod +x $srcdir/run
	chmod +x $srcdir/torrent-leecher-logs
	echo ""
	echo "Coping files.."
	install -d $pkgdir/etc
	install -d $pkgdir/usr/lib/systemd/system/
	install -d $pkgdir/usr/bin/
	install -d $pkgdir/opt/torrent-leecher/
	cp $srcdir/torrent-leecher.conf $pkgdir/etc/
	cp $srcdir/torrent-leecher.service $pkgdir/usr/lib/systemd/system/
	cp $srcdir/torrent-leecher-logs $pkgdir/usr/bin/
	cp $srcdir/run $srcdir/DataUnits.py $srcdir/Configs.py $srcdir/HttpServer.py $srcdir/HttpClient.py $srcdir/Logs.py $srcdir/Main.py $srcdir/Manipulator.py $pkgdir/opt/torrent-leecher/
}

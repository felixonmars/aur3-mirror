# Contributor: florianbw <florian.bw@gmail.com>

pkgname=rockerbox
pkgver=2.0.6
pkgrel=2
pkgdesc='Analysis and filtering of massive proteomics search results.'
arch=('i686' 'x86_64')
url=https://trac.nbic.nl/rockerbox
license=('Apache')
depends=('java-runtime')
source=("https://trac.nbic.nl/rockerbox/downloads/RockerBox-$pkgver-binaries.zip" \
	      'rockerbox.desktop' \
        'rockerbox.png' \
        'rockerbox')

build() {

	install -d ${pkgdir}/usr/share/java/rockerbox/
	install -d ${pkgdir}/usr/share/{applications,pixmaps}
	install -d ${pkgdir}/usr/bin

	cd ${startdir}/

	cp -r ${srcdir}/* ${pkgdir}/usr/share/java/rockerbox/
	chmod 755 ${pkgdir}/usr/share/java/rockerbox/start.sh 
	install -D -m755  rockerbox ${pkgdir}/usr/bin/
	install -D -m644  rockerbox.png ${pkgdir}/usr/share/pixmaps
	install -D -m644  rockerbox.desktop ${pkgdir}/usr/share/applications
}

DLAGENTS=('ftp::/usr/bin/wget -c --passive-ftp -t 3 --waitretry=3 -O %o %u'
          'http::/usr/bin/wget -c -t 3 --waitretry=3 -O %o %u'
          'https::/usr/bin/wget -c -t 3 --waitretry=3 --no-check-certificate -O %o %u')

md5sums=('7432b912df74d4e5037929849c80d89d'
         'd3603d56e2696a4ab29248182487aedf'
         '32403a44cf3a644487ba9ab69e073107'
         'e6c626b2c3573d55e1323f9d37f02d50')

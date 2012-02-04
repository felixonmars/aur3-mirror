# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>
pkgname=nero
pkgver=2
pkgrel=1
arch=('i686')
pkgdesc="Neuro-Evolving Robotic Operatives. A game of training and battle."
url="http://z.cs.utexas.edu/users/nn/nero/news.php"
license="other"
depends=('nas' 'aalib' 'arts' 'smpeg' 'libstdc++5')
source=(http://z.cs.utexas.edu/users/nn/nero/downloads/nero2_linux_i386.tar.gz nero.desktop icon.png)
md5sums=('0cca2730dfeb0d8c9820d62a82691587'
         '9dca0963887e76f8b1f7fab4c5ba799b'
         '7704da70e52ac4cccc6c5b9fd36aa19c')
build() 
{
	mkdir -p ${startdir}/pkg/{opt/nero,usr/bin,usr/share/applications}
	cp ${startdir}/src/icon.png ${startdir}/pkg/opt/nero
	cp ${startdir}/src/nero.desktop ${startdir}/pkg/usr/share/applications
	cp -R ${startdir}/src/nero2_linux_i386/* ${startdir}/pkg/opt/nero/
	echo -e "#! /bin/bash\ncd /opt/nero\n./nero.bin" > ${startdir}/pkg/usr/bin/nero
	chmod +x ${startdir}/pkg/usr/bin/nero
}

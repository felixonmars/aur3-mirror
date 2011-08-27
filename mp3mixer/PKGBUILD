# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=mp3mixer
pkgver=0.01
pkgrel=1
pkgdesc="Scott's Mp3 Mixer - simple system to let you mix multiple mpeg audio streams in real time"
url="http://szyzyg.arm.ac.uk/~spm/mp3mixer.html"
license="GPL"
arch=('i686' 'x86_64')
depends=('mpg123' 'alsa-oss')
source=("http://szyzyg.arm.ac.uk/~spm/mp3mixer.tar.gz")
md5sums=('24897b1d7f6778dbfef1b56f2e3ebb01')

build() {
	cd ${srcdir}/ || return 1
	make mixer || return 1

	mkdir -p ${pkgdir}/usr/bin/
	cp -f mixer  ${pkgdir}/usr/bin/mp3mixer-oss
	cat > ${pkgdir}/usr/bin/mp3mixer <<EOF
#!/bin/sh
/usr/bin/aoss /usr/bin/mp3mixer-oss
EOF

	chmod -R 755 ${pkgdir}/usr/bin
}

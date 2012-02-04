# Maintener: Deather <deather.jeuxlinux@gmail.com>

pkgname=php-getid3
pkgver=1.9.3
pkgrel=1
pkgdesc="A PHP library which allow read song tag (OGG/MP3)"
arch=('i686' 'x86_64')
url="http://getid3.sourceforge.net/"
license=('GPL')
depends=('php>=5.0.5', 'vorbis-tools')
source=('http://sourceforge.net/projects/getid3/files/getID3%28%29%201.x/1.9.3/getid3-1.9.3-20111213.zip')
md5sums=('00990e23f4035c29974d025cc5f3eeb7')

build(){
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"

	rm -rf "${srcdir}/getid3/!delete any module you don't like, but check dependencies.txt"

	cp -r ${srcdir}/getid3 ${pkgdir}/usr/share/${pkgname}

	# Doc part
	cp -r ${srcdir}/changelog.txt ${srcdir}/dependencies.txt ${srcdir}/readme.txt ${srcdir}/structure.txt ${pkgdir}/usr/share/doc/${pkgname}
	cp -r ${srcdir}/demos ${pkgdir}/usr/share/doc/${pkgname}/examples

	# Licences part
	install -D -m644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licences/${pkgname}/LICENSE"
	install -D -m644 "${srcdir}/license.commercial.txt" "${pkgdir}/usr/share/licences/${pkgname}/LICENSE.COMMERCIAL"

	msg "Don't forget to add the path '/usr/share/php-getid3' to 'open_basedir' and 'include_path' in the php.ini file."
}

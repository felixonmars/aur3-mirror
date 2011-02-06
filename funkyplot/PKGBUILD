# Contributor: Tilman Blumenbach <tilman (at) ax86 (dot) net>

pkgname='funkyplot'
pkgver='1.1.0_pre1'
pkgrel=1
pkgdesc='Graph plotting program, currently only available in German.'
arch=('i686' 'x86_64')
url='http://funkyplot.de'
license=('GPL')
depends=('python' 'gtk2' 'pygtk' 'pil')
source=('http://downloads.sourceforge.net/funkyplot/funkyplot-1.1.0-pre1.tar.gz')
md5sums=('107ee1430d304d6c0befbf5ebaae1b66')

build()
{
	cd "${srcdir}/funkyplot-${pkgver//_/-}"

	# Delete unneeded files
	rm -rf INSTALL windows

	# Set permissions
	find . -type d '!' -perm 0755 -exec chmod 755 {} ';'
	find . -type f '!' -perm 0644 '!' -path './funkyplot.py' -exec chmod 644 {} ';'
	chmod 755 funkyplot.py

	# Create directories and copy files
	mkdir -p "${pkgdir}/opt/funkyplot" "${pkgdir}/usr/bin"
	cp -r . "${pkgdir}/opt/funkyplot"

	# Symlink funkyplot.py
	cd "${pkgdir}/usr/bin"
	ln -s /opt/funkyplot/funkyplot.py funkyplot

	# Debug:
	#msg2 Stopping...
	#return 1

	return 0
}

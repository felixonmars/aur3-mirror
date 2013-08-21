# Maintainer: mmm
# Contributor: Algunenano
pkgname=javanns
pkgver=1.1
pkgrel=3
pkgdesc="Java Neural Network Simulator-create, test, validate, represent neural network problems in a nice GUI"
arch=("i686" "x86_64")
url="http://www.ra.cs.uni-tuebingen.de/software/JavaNNS/"
license=("GPL")
install=javanns.install
makedepends=('tar')
depends=('java-runtime>=1.3')

_pkg="JavaNNS-LinuxIntel.tar.gz"
if test "$CARCH" == x86_64; then
  _pkg="JavaNNS-LinuxAMD64.tar.gz" 
fi
source=('javanns' 
	'javanns.desktop'
	http://www.ra.cs.uni-tuebingen.de/downloads/JavaNNS/$_pkg
	)

md5sums=('1338402701874ac171e572313d8c0376'
         '1f88b48126c3a68c9eba91aacf42fb00'
	 '181e9a9159b9539d59e51af64a41cd42'
	)
if test "$CARCH" == x86_64; then
  md5sums=('1338402701874ac171e572313d8c0376'
	  '1f88b48126c3a68c9eba91aacf42fb00'
	  '69204379e41be3916c11ef6f03ac1f38'
	  )
fi

package() {
	install -d "${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/doc/$pkgname" \
		"${pkgdir}/usr/share/applications" \
		"${pkgdir}/opt/javanns"

	install -m755 javanns  "$pkgdir/usr/bin/"


 	install -d "${pkgdir}/opt/javanns/examples" \
 		"${pkgdir}/opt/javanns/manual"
	cp -rPf "${srcdir}/examples"/* "${pkgdir}/opt/javanns/examples"
	cp -rPf "${srcdir}/manual"/* "${pkgdir}/opt/javanns/manual"
	
	install -m644 JavaNNS.jar "${pkgdir}/opt/javanns"
	install -m644 "${srcdir}/javanns.desktop" \
		"${pkgdir}/usr/share/applications/javanns.desktop"

	ln -s /opt/javanns/examples $pkgdir/usr/share/doc/javanns/examples
	ln -s /opt/javanns/manual $pkgdir/usr/share/doc/javanns/manual
}

# vim: set noet ff=unix:

# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=scm-manager
_pkgname=scm-server
pkgver=1.35
pkgrel=1
pkgdesc="Share and manage Git, Mercurial and Subversion repositories over HTTP"
url="https://bitbucket.org/sdorra/scm-manager"
arch=('i686' 'x86_64')
license=('BSD')
depends=('java-environment')
source=(
	"http://maven.scm-manager.org/nexus/content/repositories/releases/sonia/scm/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}-app.tar.gz"
	"scm-manager.service"
	"scm-server.defaults"
)
md5sums=(
	'b421c6ad23d72fdf720fb1c98ab87848'
	'3a0f7979478b753b6386b2be90075897'
	'35f093fa28a8838b70f66059316027ee'
)


build() {
	:
}

package() {
	cd "${srcdir}"
	
	install -D -m 0644 scm-server.defaults "${pkgdir}/etc/default/scm-server"
	install -d -m 0755 "${pkgdir}/var/scm-manager"
	install -D -m 0644 scm-manager.service "${pkgdir}/usr/lib/systemd/system/scm-manager.service"
		
	cd "${_pkgname}"
	
	install -d -m 0755 "${pkgdir}/opt/scm-manager/"
	
	install -d -m 0755 "${pkgdir}/opt/scm-manager/lib"
	for i in lib/*.jar; do
		install -m 0644 $i "${pkgdir}/opt/scm-manager/$i"
	done
	
	install -d -m 0755 "${pkgdir}/opt/scm-manager/libexec"
	if [ "$CARCH" = "x86_64" ]; then
		install -D -m 0755 "libexec/jsvc-linux-x86_64" "${pkgdir}/opt/scm-manager/libexec/"
	else
		install -D -m 0755 "libexec/jsvc-linux-i686" "${pkgdir}/opt/scm-manager/libexec/"
	fi
	
	install -d -m 0755 "${pkgdir}/opt/scm-manager/var/webapp/docroot"
	install -m 0644 "var/webapp/docroot/index.html" "${pkgdir}/opt/scm-manager/var/webapp/docroot/index.html"
	install -m 0644 "var/webapp/scm-webapp.war" "${pkgdir}/opt/scm-manager/var/webapp/scm-webapp.war"
		
	install -d -m 0755 "${pkgdir}/opt/scm-manager/conf"
	install -D -m 0644 conf/* "${pkgdir}/opt/scm-manager/conf"
	
	install -D -m 0755 bin/scm-server "${pkgdir}/usr/sbin/scm-server"
}


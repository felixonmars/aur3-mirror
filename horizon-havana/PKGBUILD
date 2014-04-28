# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="horizon-havana"
pkgver=2013.2.3
_pkgname=horizon
_relname=havana
pkgrel=1
install=horizon.install
pkgdesc="Openstack dashboard"
arch=("i686" "x86_64")
url="http://www.launchpad.net/horizon/"
license=("Apache")

depends=('python2-pbr>=0.5.21'
         'python2-pbr<1.0'
         'python2-django-openstack>=1.4'
         'python2-django-openstack<1.6'
         'python2-django-compressor>=1.3'
         'python2-django-openstack-auth>=1.1.3'
         'python2-eventlet>=0.13.0'
         'python2-kombu>=2.4.8'
         'python2-lesscpy>=0.9j'
         'python2-iso8601>=0.1.8'
         'python2-netaddr'
         'python2-cinderclient>=1.0.6'
         'python2-glanceclient-havana>=0.9.0'
         'python2-heatclient>=0.2.3'
         'python2-keystoneclient>=0.3.2'
         'python2-novaclient>=2.15.0'
         'python2-neutronclient>=2.3.0'
         'python2-neutronclient<3.0'
         'python2-swiftclient-havana>=1.5'
         'python2-ceilometerclient>=1.0.5'
         'python2-troveclient-havana<1.0'
         'python2-pytz>=2010h'
         'python2-lockfile>=0.8')

makedepends=("python2-setuptools")
conflicts=("horizon", "openstack-horizon-git")
source=("https://launchpad.net/${_pkgname}/${_relname}/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz"
	"openstack-dashboard.conf")
md5sums=('01a4046483f63641c4a4936098a42567'
         '1d35d3120c3b1a1c41e1ca18207f5245')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  mkdir "${pkgdir}/usr/"
  mkdir "${pkgdir}/usr/share/"
  cp -a "./build/lib" "${pkgdir}/usr/share/openstack-dashboard"
  cp "${pkgdir}/usr/share/openstack-dashboard/openstack_dashboard/local/local_settings.py.example" "${pkgdir}/usr/share/openstack-dashboard/openstack_dashboard/local/local_settings.py"
  install -d -m 0755 "${pkgdir}"/etc/httpd/conf/extra/
  install -m 644 ${srcdir}/openstack-dashboard.conf ${pkgdir}/etc/httpd/conf/extra/openstack-dashboard.conf
#  cp -a "${pkgdir}/usr/share/openstack-dashboard/static/dashboard/css" "${pkgdir}/usr/share/openstack-dashboard/openstack-dashboard/static/dashboard/"
#  cp -a "${pkgdir}/usr/share/openstack-dashboard/static/dashboard/js" "${pkgdir}/usr/share/openstack-dashboard/openstack-dashboard/static/dashboard/"
}

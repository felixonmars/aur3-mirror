pkgname=driveclient
pkgver=1.20.008308
pkgrel=1
pkgdesc="An agent for Rackspace Cloud Backup"
url="http://www.rackspace.com/knowledge_center/article/rackspace-cloud-backup-install-the-agent"
license=('Mixed')
arch=('any')
backup=('etc/driveclient/cacert.pem')
source=("http://agentrepo.drivesrvr.com/tar/driveclient-${pkgver}.tar.bz2" driveclient.service)

install=install

package() {
	install -D "${srcdir}/${pkgname}-${pkgver}/driveclient" "${pkgdir}/usr/bin/driveclient"
	install -D "${srcdir}/${pkgname}-${pkgver}/cacert.pem" "${pkgdir}/etc/driveclient/cacert.pem"
	install -D "${srcdir}/driveclient.service" "${pkgdir}/etc/systemd/system/driveclient.service"
}
sha1sums=('08cc35ba703ef1fb3041dfaf468b64bcaddb8aae'
          'e3ad46e0e0c752505e5607537c3a87d6dd555b3d')

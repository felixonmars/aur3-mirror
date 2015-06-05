# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=('umap')
pkgver="0.7.6"
pkgrel=1
pkgdesc=('uMap lets you create maps with OpenStreetMap layers in a minute and embed them in your site')
arch=('x86_64' 'i686')
url=('https://bitbucket.org/yohanboniface/umap')
license=('WTFPL')
depends=('python-virtualenvwrapper' 'python-django' 'python-pillow' 'python-psycopg2' 'python-simplejson' 'python-south geos' 'python-social-auth' 'python-django-compressor' 'python-django-leaflet-storage')
makedepends=('python-pip' 'python-setuptools')
source=("https://bitbucket.org/yohanboniface/umap/get/${pkgver}.tar.gz")
sha512sums=('65bd4a67a58be41f75ea5126fd112441377d02557abf2212becb1746765467a6df12295cd29824c48746f465b5100c5d49fd8f53472bce205bc8ced9bec696de')

package(){
  mkdir -p "${pkgdir}/usr/share/webapps/"
  cp -r "${srcdir}/yohanboniface-umap-65fc239406b0" "${pkgdir}/usr/share/webapps/umap"
}

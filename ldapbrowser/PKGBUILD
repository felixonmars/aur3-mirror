# Contributor: Marco A Rojas <marquicus at gmail dot com>

pkgname=ldapbrowser
pkgver=2.8.2
pkgrel=2
pkgdesc="Popular LDAP Browser/Editor by Jarek Gawor"
url="https://www.netiq.com/communities/cool-solutions/wp-content/uploads/sites/2/2009/07/Gawor_ldapbrowser_282.zip"
license=('custom')
depends=('java-runtime' 'bash' 'unzip')
arch=('any')
options=('!strip') 
source=(https://www.netiq.com/communities/cool-solutions/wp-content/uploads/sites/2/2009/07/Gawor_${pkgname}_${pkgver//./}.zip lbe.patch)
noextract=(Gawor_${pkgname}_${pkgver//./}.zip)
md5sums=('6f50f3d02239057188d55b837db829b8'
         'a5860d8b8b02cc8d3f861a82bfc05f8b')

package() {
  cd $pkgdir

  install -dm0755 ${pkgdir}/opt/${pkgname}/{,ldif} 
  unzip -q ${srcdir}/Gawor_${pkgname}_${pkgver//./}.zip -d opt/${pkgname}

  rm opt/${pkgname}/lbe.{old*,bat}
  patch -p0 < ${srcdir}/lbe.patch

  install -Dm755 ${pkgdir}/opt/${pkgname}/lbe.sh $pkgdir/usr/bin/lbe
  rm  ${pkgdir}/opt/${pkgname}/lbe.sh
}

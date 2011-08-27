# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>

pkgname=wifidog-auth
pkgver=1417
pkgrel=1
pkgdesc="A complete and embeddable captive portal solution for operating an open hotspot or network of hotspots while preventing abuse of their Internet connection."
arch=('any')
url="http://dev.wifidog.org"
license=('GPLv2')
groups=('wifidog')
depends=('apache' 'php>=5.0.0' 'postgresql>=8.0.0')
makedepends=('subversion')
install='wifidog-auth-svn.install'
optdepends=('PHP DOM extension: for RSS support' 'PEAR Radius: for RADIUS authenticaton support' 'Phlick API: for Flickr content support')
options=(!strip !zipman)

_svntrunk="https://dev.wifidog.org/svn/trunk/wifidog-auth"
_svnmod=$pkgname
_instdir='srv/http/wifidog-auth'

build() {
  cd ${srcdir}
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi 
}

package() {
  cd ${srcdir}

  mkdir -p ${pkgdir}/${_instdir}
  cp -ra wifidog-auth/wifidog/* ${pkgdir}/${_instdir}/
  echo "deny from all" > ${pkgdir}/${_instdir}/.htaccess

  # Fix permissions
  chown -R root:root ${pkgdir}/${_instdir}/
  chown 33:33 ${pkgdir}/${_instdir}/config.php
  chown 33:33 ${pkgdir}/${_instdir}/tmp
  chown 33:33 ${pkgdir}/${_instdir}/tmp/magpie_cache
  chown 33:33 ${pkgdir}/${_instdir}/tmp/smarty/templates_c
  chown 33:33 ${pkgdir}/${_instdir}/lib
}

# vim:set ts=2 sw=2 et:

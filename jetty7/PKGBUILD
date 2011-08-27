# Contributor: Yejun Yang <yejunx AT gmail.com>
pkgname=jetty7
pkgver=7.4.4
_buildver=.v20110707
pkgrel=1
pkgdesc="A full-fledged production-grade lightweight Java Servlet Container"
arch=('any')
url="http://jetty.mortbay.org/jetty/"
license="Apache"
depends=('java-runtime')

source=(http://dist.codehaus.org/jetty/jetty-hightide-${pkgver}/jetty-hightide-${pkgver}${_buildver}.tar.gz
jetty.rc jetty.default)
backup=(etc/default/jetty7 
opt/jetty7/etc/jdbcRealm.properties  opt/jetty7/etc/jetty-deploy.xml      opt/jetty7/etc/jetty-jmx.xml      opt/jetty7/etc/jetty-requestlog.xml  opt/jetty7/etc/jetty-xinetd.xml  opt/jetty7/etc/login.properties
opt/jetty7/etc/jetty-ajp.xml         opt/jetty7/etc/jetty-fileserver.xml  opt/jetty7/etc/jetty-logging.xml  opt/jetty7/etc/jetty-rewrite.xml     opt/jetty7/etc/jetty.conf        opt/jetty7/etc/realm.properties
opt/jetty7/etc/jetty-bio-ssl.xml     opt/jetty7/etc/jetty-hightide.xml    opt/jetty7/etc/jetty-plus.xml     opt/jetty7/etc/jetty-ssl.xml         opt/jetty7/etc/jetty.xml         opt/jetty7/etc/webdefault.xml
opt/jetty7/etc/jetty-bio.xml         opt/jetty7/etc/jetty-ipaccess.xml    opt/jetty7/etc/jetty-policy.xml   opt/jetty7/etc/jetty-stats.xml       opt/jetty7/etc/keystore
opt/jetty7/etc/jetty-debug.xml       opt/jetty7/etc/jetty-jaas.xml        opt/jetty7/etc/jetty-proxy.xml    opt/jetty7/etc/jetty-testrealm.xml   opt/jetty7/etc/login.conf
)

build() {
  mkdir -p $startdir/pkg/opt
  cp -a $startdir/src/jetty-hightide-${pkgver}${_buildver} $startdir/pkg/opt/$pkgname
  install -D -m755 $startdir/src/jetty.rc $startdir/pkg/etc/rc.d/jetty7
  install -D -m644 $startdir/src/jetty.default $startdir/pkg/etc/default/jetty7
}

md5sums=('c6c057cf719f13c187b81ad4361fcab3'
         'ba23f546c13b16b7613fc90409e2526b'
         '38c4a18f65e1ea94682b3fca13956c47')

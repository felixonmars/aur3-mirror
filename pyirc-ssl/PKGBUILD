pkgname=pyirc-ssl
pkgver=0.4
pkgrel=3
pkgdesc="jabber irc transport with SSL patch"
arch=('i686' 'x86_64')
url="http://xmpppy.sourceforge.net/irc/"
license=('GPL')
backup=(etc/$pkgname.xml)
depends=('python2' 'twisted' 'python-irclib')
source=(http://download.sourceforge.net/sourceforge/xmpppy/irc-transport-${pkgver}.tar.gz \
        pyirc-ssl.rc \
        config.xml \
        pyirc-ssl.patch)
md5sums=('414411cc20a1cfd3559d1ff546dfd424'
         '3deb428a954365deb2512373cb54d52c'
         '188ed5a554598a7ae7f213157514f972'
         '3d3c05a75a01a4018e86beb5618bf1d8')

build() {
  cd $srcdir/irc-transport-${pkgver}/
  patch -p0 < ../pyirc-ssl.patch
  cd $srcdir

  install -d -m0755 $pkgdir/usr/lib && \
  cp -r irc-transport-${pkgver} $pkgdir/usr/lib && \
  mv $pkgdir/usr/lib/irc-transport-${pkgver} $pkgdir/usr/lib/$pkgname && \
  install -d -m0755 $pkgdir/var/spool/$pkgname && \
  install -D -m0644 ./config.xml $pkgdir/etc/$pkgname.xml && \
  mv $pkgdir/usr/lib/$pkgname/config_example.xml $pkgdir/etc/${pkgname}_example.xml && \
  ln -s ../../../etc/$pkgname.xml $pkgdir/usr/lib/$pkgname/config.xml && \
  install -D -m0755 ${pkgname}.rc $pkgdir/etc/rc.d/$pkgname
}

pkgname=pyirc
pkgver=0.4
pkgrel=3
pkgdesc="jabber irc transport"
arch=('i686' 'x86_64')
url="http://xmpppy.sourceforge.net/irc/"
license=('GPL')
backup=(etc/$pkgname.xml)
depends=('python2' 'twisted' 'python-irclib')
source=(http://download.sourceforge.net/sourceforge/xmpppy/irc-transport-${pkgver}.tar.gz \
        pyirc.rc \
        config.xml)
md5sums=('414411cc20a1cfd3559d1ff546dfd424'
         '7de1087c0be35180410e20514dd40f6e'
         '6d3b4db046d126b6bf57ab7cd7437bf7')

build() {
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

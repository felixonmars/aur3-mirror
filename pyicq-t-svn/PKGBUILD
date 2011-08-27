pkgname=pyicq-t-svn
pkgver=0.1
pkgrel=3
pkgdesc="jabber icq transport"
arch=('i686' 'x86_64')
url="http://webkeks.org/"
license=('GPL')
backup=(etc/ejabberd/$pkgname.xml)
depends=('python' 'twisted')
source=(https://webkeks.org/hg/webkeksicq-t/archive/tip.tar.gz \
        pyicq.rc \
        config.xml)
md5sums=('a8b7b3a497258b85d6ebb58c61ddb633'
         '7ad73461eda9d7b4a69dd488e4f72f93'
         '50beb21846543a7c50e51d57873d03b6')

build() {
  cd $srcdir

  install -d -m0755 $pkgdir/usr/lib && \
  cp -r WebKeks* $pkgdir/usr/lib && \
  mv $pkgdir/usr/lib/WebKeks* $pkgdir/usr/lib/$pkgname && \
  install -d -m0755 $pkgdir/var/spool/$pkgname && \
  install -D -m0644 ./config.xml $pkgdir/etc/ejabberd/$pkgname.xml && \
  mv $pkgdir/usr/lib/$pkgname/config_example.xml $pkgdir/etc/ejabberd/${pkgname}_example.xml && \
  ln -s ../../../etc/ejabberd/$pkgname.xml $pkgdir/usr/lib/$pkgname/config.xml && \
  install -D -m0755 pyicq.rc $pkgdir/etc/rc.d/$pkgname
}

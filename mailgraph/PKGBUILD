# Contributor: lp76 <l.peduto@gmail.com>
pkgname=mailgraph
pkgver=1.14
pkgrel=2
pkgdesc="A very simple mail statistics RRDtool frontend for Postfix and Sendmail"
url="http://mailgraph.schweikert.ch/"
arch=(i686)
license=('GPL')
install=$pkgname.install
options=(emptydirs)
depends=('apache' 'rrdtool' 'perl' 'perl-file-tail' 'ttf-dejavu')
source=(http://mailgraph.schweikert.ch/pub/$pkgname-$pkgver.tar.gz mailgraph mailgraph.conf.d)
md5sums=('0f0ae91968ea7ae0c1d14985c560530b' 'a9e4330fb771561990d76fbbe97acfa8' 'f7829513ba7b6016de4a7ba55615fb3e')

build() {
  export CGI_DIR=`grep 'ScriptAlias /cgi-bin/' /etc/httpd/conf/httpd.conf | awk '{print $3}' | sed 's|"||g'`
  cd $srcdir/$pkgname-$pkgver
  sed -i "s:mailgraph.rrd:/var/lib/mailgraph/mailgraph.rrd:" mailgraph.cgi
  sed -i "s:mailgraph_virus.rrd:/var/lib/mailgraph/mailgraph_virus.rrd:" mailgraph.cgi
  install -D -m755 mailgraph.pl $pkgdir/usr/bin/mailgraph.pl
  install -D -m755 mailgraph.cgi $pkgdir/$CGI_DIR/mailgraph.cgi
  install -D -m755 $srcdir/mailgraph $pkgdir/etc/rc.d/mailgraph
  install -D -m644 $srcdir/mailgraph.conf.d $pkgdir/etc/conf.d/mailgraph
  install -d -m755 $pkgdir/var/lib/mailgraph
}

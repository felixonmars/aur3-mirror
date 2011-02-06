# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Based on Gentoo ebuild: http://gentoo-portage.com/www-servers/gorg
pkgname=gorg
pkgver=0.6.3
pkgrel=1
pkgdesc="Back-end XSLT processor for an XML-based web site."
arch=('i686' 'x86_64')
url="http://gentoo.neysx.org/mystuff/gorg/gorg.xml"
license=('GPL')
depends=('libxml2>=2.6.16' 'libxslt>=1.1.12' 'ruby')
optdepends=('apache: for usage with Apache'
             'ruby-fcgi: for fast CGI support'
             'mysql-ruby: for MySQL support'
             'ruby-dbi: for MySQL support')
backup=('etc/gorg/gorg.conf')
options=('emptydirs')
source=(http://gentoo.neysx.org/mystuff/gorg/$pkgname-$pkgver.tgz)
md5sums=('e32c7e3b4604a483ec9cdc1af648be8f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix listen issue with webrick
  sed -e 's/WEBrick::HTTPServer.new(/WEBrick::HTTPServer.new( :BindAddress=>"127.0.0.1",/' -i lib/gorg/www.rb

  ruby setup.rb config --prefix=/usr
  ruby setup.rb setup
  ruby setup.rb install --prefix="$pkgdir"

  # install doesn't seem to chmod these correctly, forcing it here
  _sitelibdir=$(ruby -r rbconfig -e 'puts Config::CONFIG["sitelibdir"]')
  chmod +x "$pkgdir"/$_sitelibdir/gorg/cgi-bin/*.cgi
  chmod +x "$pkgdir"/$_sitelibdir/gorg/fcgi-bin/*.fcgi

  # Add cache dir
  install -d -m 750 -o http -g http "$pkgdir"/var/cache/gorg

  # Copy sample configs
  cp -R etc "$pkgdir"/etc
}

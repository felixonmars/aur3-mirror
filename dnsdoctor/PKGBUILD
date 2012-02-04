# Contributor: Krzysztof Raczkowski <raczkow@prz.edu.pl>
pkgname=dnsdoctor
pkgver=1.0.1
pkgrel=1
pkgdesc="DNS (Domain Name System) checking tool"
arch=('i686' 'x86_64')
url="http://www.dnsdoctor.org"
license=('GPL')
depends=('ruby' 'libxml2')
source=(http://www.dnsdoctor.org/attachments/download/7/$pkgname-$pkgver.tgz)
md5sums=(6c27544590f929fdd536e7cb4e51eea4)

build() {
  cd "$srcdir/$pkgname"

  ruby installer.rb -DPREFIX=$pkgdir/usr configure common cli
  
  # fix /usr/bin/ files
  ln -sf /usr/libexec/dnsdoctor/dnsdoctor/zc.rb $pkgdir/usr/bin/dnsdoctor
  
  # fix /etc/ files
  mv $pkgdir/usr/etc/ $pkgdir/etc/
  
  # fix paths
  sed -e "s:/var/abs/local/archrak/dnsdoctor/pkg::" \
      -e "s:/usr/etc/dnsdoctor:/etc/dnsdoctor:" \
      -i $pkgdir/usr/libexec/dnsdoctor/dnsdoctor/zc.rb
}

# vim:set ts=2 sw=2 et:

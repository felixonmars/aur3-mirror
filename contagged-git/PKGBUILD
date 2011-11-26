pkgname=contagged-git
pkgver=20111125
pkgrel=1
pkgdesc="LDAP addressbook web-interface"
arch=(any)
url="http://www.cosmocode.de/en/opensource/contagged"
license=('GPL')
depends=('php-ldap')
backup=('srv/http/contagged/inc/config.php')
source=("contagger-$pkgver.zip::https://github.com/cosmocode/contagged/zipball/master")
md5sums=('21b89e01f9f071cf9818c8187a39fcbe')

build() {
  cd "$srcdir/"
  true
}

package() {
  cd "$srcdir/"
  mkdir -p $pkgdir/srv/http/
  cp -a cosmocode-contagged-*/ $pkgdir/srv/http/contagged

  cd $pkgdir/srv/http/contagged
  find . -type f -exec chmod 0644 {} \;
  find . -type d -exec chmod 0755 {} \;
  chown -R http:http cache
  chmod 0775 cache
}

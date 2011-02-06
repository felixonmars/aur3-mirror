# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
pkgname=java-smack
pkgver=3.1.0
pkgrel=1
pkgdesc="Easy to use Java XMPP client library"
arch=(any)
url="http://www.igniterealtime.org/projects/smack/"
license=(APACHE)
depends=()
source=(http://www.igniterealtime.org/downloadServlet?filename=smack/smack_3_1_0.tar.gz)
md5sums=('60364fdc8bc5d260f57e4f740b133128')

build() {
  cd "$srcdir/smack_3_1_0"

  # Install the .jar libraries
  install -d "$pkgdir/usr/share/java/smack/"
  install -Dm644 *.jar "$pkgdir/usr/share/java/smack"

  # Install documentation
  return 0 # Comment out this line if you want to install the docs
  cd documentation
  install -d "$pkgdir/usr/share/smack/documentation/{extensions,images}"
  install -Dm644 *.html            "$pkgdir/usr/share/smack/documentation/"
  install -Dm644 extensions/*.html "$pkgdir/usr/share/smack/documentation/extensions/"
  install -Dm644 images/*.html     "$pkgdir/usr/share/smack/documentation/images/"

}

# vim:set ts=2 sw=2 et:

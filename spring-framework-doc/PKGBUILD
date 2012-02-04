# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
_realname=spring-framework
pkgname=spring-framework-doc
pkgver=3.0.5
pkgrel=1
pkgdesc="An application framework for the Java platform"
url="http://www.springsource.org/"
arch=('any')
license=('Apache')
depends=()
source=("http://s3.amazonaws.com/dist.springframework.org/release/SPR/$_realname-$pkgver.RELEASE-with-docs.zip")
md5sums=('37d7ede240f78ae8cf18c7f9524257e7')
build() {
  mkdir -p $pkgdir/usr/share/doc/$_realname
  cd $srcdir/$_realname-$pkgver.RELEASE/docs
  cp -r javadoc-api $_realname-reference $pkgdir/usr/share/doc/$_realname
  rm -rf "$pkgdir/usr/share/doc/$_realname/$_realname-reference/htmlsingle"
}

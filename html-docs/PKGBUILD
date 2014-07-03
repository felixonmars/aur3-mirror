# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=html-docs
pkgver=4.01
pkgrel=3
pkgdesc="SGML DTD and documentation for HTML 4.01."
arch=('any')
url="http://www.w3.org/TR/html401"
license=('GPL')
options=('docs')
source=(http://www.w3.org/TR/1999/REC-html401-19991224/html40.tgz profile.sh)
md5sums=('1ed76627ba80816079649f67023ec7ab'
	 '254964bb5a508a3af0dc7d01b0e7d370')

# Work around server indicating a "gzip"-encoded "gzip" file
makedepends+=(curl)
DLAGENTS=(http::"$(command -v curl) --no-compression %u -o %o")

build(){
  cd "$srcdir"
  rm html40.tgz
  mkdir -p "$pkgdir/usr/share/doc/html"
  cp -rf * "$pkgdir/usr/share/doc/html"
  install -D -m 555 "$srcdir/profile.sh" "$pkgdir/etc/profile.d/html-dtd.sh"
  echo >>"$pkgdir/usr/share/doc/html/HTML4.cat" 'DTDDECL "-//W3C//DTD HTML 4.01//EN" HTML4.decl'
  echo >>"$pkgdir/usr/share/doc/html/HTML4.cat" 'DTDDECL "-//W3C//DTD HTML 4.01 Transitional//EN" HTML4.decl'
  echo >>"$pkgdir/usr/share/doc/html/HTML4.cat" 'DTDDECL "-//W3C//DTD HTML 4.01 Frameset//EN" HTML4.decl'
}

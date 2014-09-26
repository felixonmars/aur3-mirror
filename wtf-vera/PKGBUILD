pkgname=wtf-vera
pkgver=7.8
pkgrel=1
pkgdesc="A list of computer related acronyms (wtf format)"
arch=(any)
url="http://home.snafu.de/ohei/vera/vueber-e.html"
license=('FDL')
depends=('wtf')
source=(http://home.snafu.de/ohei/FTP/vera${pkgver//./}.zip)
md5sums=('52ccbfbbedea62180fd65cd6c430cc9c')

build() {
  iconv -f ISO-8859-1 -t UTF-8 vera.1 | tr -d '\r' |
  LC_CTYPE=C awk '
  BEGIN {
    len = 13 # fixed length of the left column
  }
  !/^[^[:space:]]+: |^[*%[:space:]]|^$/ {
    sub(/[[:space:]]+$/, "")
    a = toupper(substr($0, 1, len)) # wtf requires acronyms to be uppercase
    sub(/[[:space:]]+$/, "", a)
    printf("%s\t%s\n", a, substr($0, len+1))
  }' > vera
}

package() {
  install -D -m 644 vera "$pkgdir"/usr/share/wtf/acronyms.vera

  # For compatibility with the original 'wtf'
  install -d "$pkgdir"/usr/share/misc/
  ln -sT ../wtf/acronyms.vera "$pkgdir"/usr/share/misc/acronyms.vera
}

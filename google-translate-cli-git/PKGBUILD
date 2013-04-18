# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=google-translate-cli-git
pkgver=15.7127022
pkgrel=1
pkgdesc="Google Translate to serve as a command line tool"
arch=('any')
url="http://www.soimort.org/google-translate-cli/"
license=('custom:The Beer-ware License')
depends=('awk')
makedepends=('git')
source=('google-translate-cli::git://github.com/soimort/google-translate-cli.git')
md5sums=('SKIP')
install=google-translate-cli-git.install

pkgver() {
  cd "$srcdir/google-translate-cli"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  install -Dm0755 "$srcdir/google-translate-cli/translate.awk" "$pkgdir/usr/bin/translate"
  ln -s /usr/bin/translate "$pkgdir/usr/bin/trs"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  head -n 7 "$srcdir/google-translate-cli/translate.awk" | tail -n +2 > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

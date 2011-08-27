# Maintainer: Ryan Peters <sloshy45@sbcglobal.net>
# Contributor: (copied and pasted text from his PKGBUILD) Ismael Carnales <icarnales@gmail.com>

pkgname=rhythmbox-microblogger
pkgver=0.5.2
pkgrel=1
pkgdesc="Post the song you are listening to on Rhythmbox to your microblog."
arch=('any')
url="http://github.com/aliva/rhythmbox-microblogger"
license=('GPL')
depends=('rhythmbox' 'python' 'httplib2' 'python2-gconf')
makedepends=('git')
source=("https://github.com/aliva/${pkgname}/tarball/v${pkgver}")
md5sums=('3bcc2a1d9176b475f11d08d894ce9854')

build() {
  cd "$srcdir/"
  mkdir -p "usr/lib/rhythmbox/plugins/"  
  mv "aliva-$pkgname-2357b4f" "usr/lib/rhythmbox/plugins/$pkgname/"
  cp -R "usr/" "$pkgdir/"
}

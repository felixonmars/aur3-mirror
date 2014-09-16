# Maintainer: mirandir <mirandir@orange.fr>

pkgname=2048-git
_realname=2048
pkgver=5385464
pkgrel=1
pkgdesc="Join the numbers and get to the 2048 tile!"
arch=('any')
url=('http://gabrielecirulli.github.io/2048/')
license=('MIT')
depends=('xdg-utils')
makedepends=('git')
optdepends=('firefox: a web browser is required' 'chromium: a web browser is required' 'epiphany: a web browser is required')
source=('2048.desktop'
        2048::git+https://github.com/gabrielecirulli/2048)
sha256sums=('79415ee8569fb8e9782de2f18b056e7e24908e2cde4bae9cf74e428b1f743eda'
            'SKIP')

pkgver() {
  cd "${srcdir}/${_realname}"
  git describe --always | sed 's|-|.|g'
}

package() {
    cd $srcdir

   install -d $pkgdir/usr/share/{applications,2048}
   cp -r $srcdir/$_realname/js $pkgdir/usr/share/2048/
   cp -r $srcdir/$_realname/meta $pkgdir/usr/share/2048/
   cp -r $srcdir/$_realname/style $pkgdir/usr/share/2048/
   install -D -m 644 $srcdir/2048.desktop $pkgdir/usr/share/applications/
   install -D -m 644 $srcdir/$_realname/LICENSE.txt $pkgdir/usr/share/2048/
   install -D -m 644 $srcdir/$_realname/README.md $pkgdir/usr/share/2048/README
   install -D -m 644 $srcdir/$_realname/Rakefile $pkgdir/usr/share/2048/
   install -D -m 644 $srcdir/$_realname/favicon.ico $pkgdir/usr/share/2048/
   install -D -m 644 $srcdir/$_realname/index.html $pkgdir/usr/share/2048/
}


# Contributor: matthiaskrgr <matthias · krueger _strange_curved_character_ famsik · de

pkgname=gitdiffbinstat
pkgver=4.7
pkgrel=1
pkgdesc="A bash script to get a git diff --shortstat-like output for changes in binary files"
arch=('any')
url="https://github.com/matthiaskrgr/gitdiffbinstat"
license=('GPL')
depends=('git' 'gawk' 'grep')
changelog=changelog
source=(gitdiffbinstat-$pkgver.zip::https://github.com/matthiaskrgr/gitdiffbinstat/zipball/$pkgver
        changelog)
sha1sums=('cce3d2375c7af235d28b6a6b55984e13052b6796'
          '4291e6b13c5b0a440c33bacd2072cc55669aa026')

package() {
  cd "$srcdir/matthiaskrgr-gitdiffbinstat-7eb8e9f"
  install -Dm 755 ./gitdiffbinstat.sh ${pkgdir}/usr/bin/gitdiffbinstat
}

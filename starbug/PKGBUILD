# Maintainer: Ali Gangji <ali at neonrain dot com>

pkgname=starbug
pkgver=0.9.1
pkgrel=1
pkgdesc="An open source web application framework for PHP"
arch=('i686' 'x86_64')
url="http://www.starbugphp.com/"
license=('GPL')
optdepends=('saxon: XSLT code generation. Required for deployment'
'bash-completion: sb command auto completion');
install=('starbug.install')
source=(https://github.com/cogentParadigm/Starbug/tarball/v0.9.1-installer)
md5sums=('915717423fcb659e4f151fe1acc20be8')

package() {
	cd $srcdir/cogentParadigm*
	cp -r etc usr $pkgdir/
}

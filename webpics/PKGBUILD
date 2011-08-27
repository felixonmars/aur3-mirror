# Maintainer: IgnorantGuru <ignorantguru@users.sourceforge.net>
# This PKGBUILD will download and build the latest version
pkgname=webpics
# pkgver will be changed dynamically in build() to latest version
pkgver=1.0.0
pkgrel=2
pkgdesc="Creates a complete javascript website from a folder of pics"
PACKAGER="IgnorantGuru <ignorantguru@users.sourceforge.net>"
arch=(any)
depends=('imagemagick' 'jhead')
license=('GPL3')
url=("http://igurublog.wordpress.com/downloads/script-$pkgname/")
source=("http://downloads.sourceforge.net/project/ig-scripts/$pkgname.sh")
#md5sums=(`wget -O - http://downloads.sourceforge.net/project/ig-scripts/$pkgname.sh | md5sum | head -c 32`)
md5sums=('da99615523a3cb30ade3b03ca40d72c6')

build() {
	_autover=`grep -m 1 "$pkgname version [[:digit:]]" ${startdir}/$pkgname.sh | sed 's/^.* version \([[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*\).*/\1/'`
	if [ "$_autover" != "" ] && [ "$_autover" != "$pkgver" ]; then
		# link to keep yaourt happy
		ln -s $pkgname-$_autover-$pkgrel-any.pkg.tar.gz ${startdir}/$pkgname-$pkgver-$pkgrel-any.pkg.tar.gz 
		eval "pkgver=$_autover"
	fi
	cd ${startdir}/pkg || return 1
	mkdir -p usr/bin || return 1
	cd usr/bin || return 1
	cp ${startdir}/$pkgname.sh ./$pkgname
	chmod +x $pkgname
}

# Maintainer: Karsten Hinz <k.hinz@tu-bs.de>
pkgname=joepass-bin
_pkgname=JoePass
pkgver=7.6.0.1
pkgrel=3
epoch=
pkgdesc="JoePass! is a animation software for juggling patterns."
arch=('any')
url=('http://sourceforge.net/projects/joepass/' "http://koelnvention.de/w/?page_id=151" )
license=('GPL')
groups=()
depends=('wine' 'lib32-mpg123')
makedepends=()
checkdepends=()
optdepends=()
provides=('joepass')
conflicts=()
replaces=()
backup=()
options=()
install='joepass.install'
changelog=
source=(
 'http://koelnvention.de/media/JoePass-7.6.0.1.zip'
 'application-x-joepass.xml'
 'joepass.desktop'
 'joepass.install'
 'icon.png'
)
#source=(http://sourceforge.net/code-snapshots/svn/j/jo/joepass/code/joepass-code-185-trunk.zip)
noextract=()
md5sums=('e658155bb3cc0e48dcc20f12ebe27828'
         'b42993344c861288dc5ca3dc3d0a44e9'
         '4fcc07e9bfe9d01d02f5de897a915a87'
         'd2434781e85cc59b40d429d3024c2d90'
         '7b1442ec8eaacf3e0cdbec8715a3ffdb')
#md5sums=('a44e0d39544a22e3d340154e9e180a5b')
validpgpkeys=()

#build() {
	#cd "$pkgname-$pkgver"
	#./configure --prefix=/usr
	#make
#}

package() {
	cd $srcdir
	#cd "$srcdir/${_pkgname}-$pkgver"
	# create pkgdir folders 
	install -d $pkgdir/usr/bin 
	install -m777 -d $pkgdir/opt/${pkgname} 
	install -d $pkgdir/usr/share/licenses/${pkgname} 

	#places the files
	cp -r ${_pkgname}-$pkgver/* $pkgdir/opt/$pkgname/
	# licenses 
	install -m644 $pkgdir/opt/$pkgname/gpl-3.0.txt $pkgdir/usr/share/licenses/${pkgname}/GPLv3

	# executable link 
	echo \#\!/bin/sh > $pkgdir/usr/bin/$pkgname 
	echo "mkdir /tmp/$_pkgname 2&>1 /dev/null" >> $pkgdir/usr/bin/$pkgname
	echo "touch /tmp/$_pkgname/logfile.txt /tmp/$_pkgname/cmdLine.pass /tmp/$_pkgname/edit.pass /tmp/$_pkgname/errors.txt /tmp/$_pkgname/actualTemp.pass" >> $pkgdir/usr/bin/$pkgname
	echo cd /opt/$pkgname/ >> $pkgdir/usr/bin/$pkgname 
	echo 'wine ./JoePass.exe $1' >> $pkgdir/usr/bin/$pkgname 
	chmod +x $pkgdir/usr/bin/$pkgname


	# install some freedesktop.org compatibility #
	install -D -m644 "$srcdir/joepass.desktop" \
		"$pkgdir/usr/share/applications/joepass.desktop"

	#create dir
	install -dm755 "$pkgdir/usr/share/mime/packages"

	install -Dm644 "$srcdir/application-x-joepass.xml" "$pkgdir/usr/share/mime/packages/"
	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/joepass.png"

	## further fixes 
	#fix read only problem by symlinks
	cd $pkgdir/opt/$pkgname/sys
	ln -s /tmp/$_pkgname/logfile.txt logfile.txt
	ln -s /tmp/$_pkgname/cmdLine.pass cmdLine.pass
	ln -s /tmp/$_pkgname/edit.pass edit.pass
	ln -s /tmp/$_pkgname/errors.txt errors.txt
	ln -s /tmp/$_pkgname/actualTemp.pass actualTemp.pass
	cd $srcdir

	# change language to german 
	if [ `locale | grep LANG=de` ];then
		echo "insert german translation"
		cd $pkgdir/opt/$pkgname/
		cp language/german/* sys
		cd $srcdir
	fi
}

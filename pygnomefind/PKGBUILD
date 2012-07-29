# Maintainer: Marcello Mortaro <mortaromarcello@gmail.com>
pkgname=pygnomefind
_name=pyGnomeFind
pkgver=0.3.5
pkgrel=1
pkgdesc="A GUI frontend to GNU Find"
arch=('any')
url="http://www.kbrandt.com/2008/06/pygnomefind-gui-frontend-to-gnu-find.html"
license=('GPL')
groups=()
depends=(python2 pygtk libglade)
source=("http://kmbrandt.googlepages.com/$_name-$pkgver.tar.gz" $pkgname.png)
noextract=()
md5sums=('1c3529bd82b97eecdbb3791d5a3b69e2'
		 '51a4baa86b8a29ebb1b9913ef28ed312')

build() {
    cd "$srcdir/$_name-$pkgver"
    sed -i "s/pyGnomeFind.glade/\/usr\/share\/${_name}\/pyGnomeFind.glade/" $_name.py
    echo "#!/usr/bin/env bash
/usr/bin/python2 /usr/share/${_name}/${_name}.py" > $pkgname
	echo "[Desktop Entry]
Encoding=UTF-8
Name=PyGnomeFind
Comment=A GUI frontend to GNU Find
Exec=pygnomefind
Icon=pygnomefind
Terminal=false
Type=Application
Categories=GTK;Utility" > $pkgname.desktop
}

package() {
	mkdir -p $pkgdir/usr/share/$_name
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/$_name-$pkgver/pyGnomeFind.py $pkgdir/usr/share/$_name/
	cp $srcdir/$_name-$pkgver/pyGnomeFind.glade $pkgdir/usr/share/$_name/
	chmod +x $srcdir/$_name-$pkgver/$pkgname
	cp $srcdir/$_name-$pkgver/$pkgname $pkgdir/usr/bin/
	cp $srcdir/$_name-$pkgver/$pkgname.desktop $pkgdir/usr/share/applications/
	cp $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/
}

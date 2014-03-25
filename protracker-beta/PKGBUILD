# Contributor: quasi <quasi@aur.archlinux.org>

pkgname=protracker-beta
pkgver=549
pkgrel=2
pkgdesc=""
arch=('i686' 'x86_64')
url="http://protracker.sourceforge.net/"
license=(custom:FORM)
md5sums=('830a96fb24517a056d71482c49f5621f'
	 'a2f823eba59db03386d261cdb3075076'
	 '17f38359b386a70f57f127ed841bd2b5'
	 'a97c8b82073a5060ad74c5f1d2fbda2e')

source=(http://sourceforge.net/code-snapshots/svn/p/pr/protracker/code/protracker-code-$pkgver-trunk.zip
	protracker.png
	protracker.desktop
	pt_modplayer.patch
		)

build(){
    sed -e "s:\.\./bin:$srcdir/protracker-code-$pkgver-trunk/:g" -i $srcdir/protracker-code-$pkgver-trunk/make-linux.sh
    sed -e "s:protracker_linux:protracker:g" -i $srcdir/protracker-code-$pkgver-trunk/make-linux.sh
    cp ../pt_modplayer.patch $srcdir/protracker-code-$pkgver-trunk/
    cd $srcdir/protracker-code-$pkgver-trunk/
    patch -i pt_modplayer.patch
    sh ./make-linux.sh

}

package(){
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps/
    cp $srcdir/protracker-code-$pkgver-trunk/protracker $pkgdir/usr/bin
    install -Dm644 protracker.png "$pkgdir/usr/share/pixmaps/protracker.png"
    install -Dm644 protracker.desktop "$pkgdir/usr/share/applications/protracker.desktop"

}


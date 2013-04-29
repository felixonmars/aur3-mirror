
# Maintainer: Luca Fulchir <luca@fulchir.it>

pkgname=proverif_editor
pkgver=0.2
pkgrel=2
pkgdesc="automatic cryptographic protocol verifier python editor"
arch=('i686' 'x86_64')
depends=('proverif' 'python2' 'pygtk' 'pygtksourceview2')
url="http://sourceforge.net/projects/proverifeditor/"
license=('GPL')
source=('http://sourceforge.net/projects/proverifeditor/files/ProVerif%20Editor/0.2/proverif_editor_0.2.tgz/download' 'proverif_editor.desktop')
md5sums=('6e7c620daf8dc87e3c07c412926cdc41'
         '38f74448b77f3ec33c3891a6e0a456eb')
sha1sums=('41b8ea62ae928cd21f366987f93c3f82e7e0b1e5'
          '46c5e629baccc6a32f86c94b7e0016005acfb062')
sha256sums=('d1e4977bd819f95fa3854596aa5e00a5a5ff88a8e464a2135d5cdb33598e5136'
            '7be4e5259fb64093f54c9198c0c83a54583be5c2f31a4b975187d5e87c053d48')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p $pkgdir/usr/{bin,share/applications}
	cp -a $srcdir/$pkgname $pkgdir/usr/share
	cat > $pkgdir/usr/bin/proverif_editor << EOF
#!/bin/sh
cd /usr/share/proverif_editor/
/usr/bin/python2 /usr/share/proverif_editor/editor.py
EOF
	chmod +x $pkgdir/usr/bin/proverif_editor
	chmod 755 $pkgdir/usr/bin/proverif_editor

	cp $srcdir/proverif_editor.desktop $pkgdir/usr/share/applications/
}


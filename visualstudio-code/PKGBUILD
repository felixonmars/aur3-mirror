# Maintainer: Hugo Rodrigues <hugorodrigues <at> openmailbox <dot> org>
pkgname=visualstudio-code
pkgver=0.1.0
pkgrel=1
pkgdesc='A source code editor by Microsoft'
arch=('x86_64')
url='https://code.visualstudio.com/'
license=('custom')
optdepends=('mono: For .NET debuggint tools'
	'git: git integration')
provides=('VisualStudio-Code')
source=('http://download.microsoft.com/download/0/D/5/0D57186C-834B-463A-AECB-BC55A8E466AE/VSCode-linux-x64.zip'
		'vscode.desktop')
md5sums=('50d4547e3617ace370f040edace6d7cd'
		'6fec73577754d9ee18714c1fb51f08e8')

prepare() {
	rm $srcdir/VSCode-linux-x64.zip
	rm $srcdir/vscode.desktop
}

package() {
	cd $srcdir
	install -dm755 $pkgdir/opt/vs-code
	cp -R . $pkgdir/opt/vs-code/
	
	install -dm755 $pkgdir/usr/bin
	ln -s /opt/vs-code/Code $pkgdir/usr/bin/vscode
	
	install -Dm644 $srcdir/resources/app/vso.png ${pkgdir}/usr/share/pixmaps/vscode.png
	
	install -Dm644 $startdir/vscode.desktop $pkgdir/usr/share/applications/vscode.desktop
}

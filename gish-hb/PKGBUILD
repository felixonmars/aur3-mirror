# Maintainer: Carl Reinke <mindless2112 gmail com>
# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=gish-hb
pkgver=1.61
pkgrel=2
pkgdesc="[Humble Bundle] A one of a kind 2d sidescroller with a twist you play as a totally physics based ball of tar."
arch=('i686' 'x86_64')
url='http://www.chroniclogic.com/gish.htm'
license=('custom: "commercial"')
install=gish.install
depends=('libvorbis' 'openal' 'sdl' 'gcc-libs' 'sdl_image' 'mesa')
conflicts=('gish')
source=('gish_1.6.1_all.tar.gz'::'file://gish_1.6.1_all.tar.gz'
        'gish.png'
        'gish.desktop'
        'gish32bit.launcher'
        'gish64bit.launcher')
md5sums=('c2c842b0a19353113069db5c8fe8bc07'
         'f3831056f039b0d6867781d21b857993'
         'cb2f9c719e432d0d8195860f5831fe0d'
         'eafe7f167cba997cfccecae6f5ac4956'
         '303264ff383435c4c8f6843a64c51f62')
options=('!strip')

build()
{
    true
}

package()
{
	install -dm775 -ggames $pkgdir/opt/Gish
	
	cp -r $srcdir/gish/* $pkgdir/opt/Gish/
	chown -R :games $pkgdir/opt/Gish/*
	chmod -R g+rw $pkgdir/opt/Gish/*
	chmod -R g-w+x $pkgdir/opt/Gish/gish_{32,64}
	
	install -Dm644 $srcdir/gish.png     $pkgdir/usr/share/pixmaps/gish.png 
	install -Dm644 $srcdir/gish.desktop $pkgdir/usr/share/applications/gish.desktop 
	
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm755 $srcdir/gish64bit.launcher $pkgdir/usr/bin/gish 
	else
		install -Dm755 $srcdir/gish32bit.launcher $pkgdir/usr/bin/gish 
	fi
}

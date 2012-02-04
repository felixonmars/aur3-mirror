# Contributor : Andrea Fonti <andreafontict[removethis][at]gmail[dot]com>

pkgname=edumips64-unict
pkgver=0.5.2
pkgrel=3
license=(GPL)

pkgdesc='GPL porting to Java Swing of the MIPS64 instruction set simulator WinMIPS64 - UNICT install (including dinero IV)'
url='http://edumips.org/'
arch=('x86_64' 'i686')
noextract=(edumips64-0.5.2.jar)
source=('http://downloads.sourceforge.net/project/edumips64/edumips64/0.5.2/edumips64-0.5.2.jar'
	"http://edumips.org/raw-attachment/wiki/Upload/DineroIV-static-i386-linux.tar.bz2"
	"edumips64"
	"mips.lang"
  	"edumips64.desktop"
  	"edumips64-128x128.png"
  	"edumips64-16x16.png"
)

md5sums=('8acf9660db9170d4b5faa6b92eaf893a'
	 '54bed892ce218b3729c6c1aad96df348'
	 'c3d30ca12b3d0efc7c0946abdfcbf505'
	 '0e87d24e45c9902d8ee43fe33d00e98c'
	 '065fb371e79fc8fc5801dd738c100591'
	 '809c0f21f06f318894e9cd77175c5f83'
	 '14c528b437fab083961db856b3f6b55c')

depends=('java-runtime')
options=(!strip)

package() {
  install -D edumips64-0.5.2.jar ${pkgdir}/opt/edumips/edumips64-0.5.2.jar || return 1
  install -D ${srcdir}/dineroIV ${pkgdir}/usr/bin/dineroIV || return 1
  install -D edumips64 ${pkgdir}/usr/bin/edumips64 || return 1
  install -D mips.lang ${pkgdir}/usr/share/gtksourceview-3.0/language-specs/mips.lang || return 1
  install -D edumips64.desktop ${pkgdir}/usr/share/applications/edumips64.desktop || return 1
  for i in 16 128; do
    install -D -m644 edumips64-${i}x${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/edumips64.png || return 1
  done
  install -d -m755 ${pkgdir}/usr/share/pixmaps || return 1
  ln -s ${pkgdir}/usr/share/icons/hicolor/128x128/apps/$pkgname.png ${pkgdir}/usr/share/pixmaps/$pkgname.png	
}

post_install() {
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}


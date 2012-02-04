# Contributor: Kristaps Esterlins <esterlinsh@gmail.com>

pkgname=etoile
pkgver=0.4.1
pkgrel=6
pkgdesc="A lightweight Desktop Environment based on GNUstep frameworks."
arch=('i686' 'x86_64')
url="http://etoileos.com/"
license=('LGPL' 'APACHE' 'BSD' 'GPL2' 'custom:CoreObject' 'custom:EtoileFoundation' 'custom:EtoileSerialize' 'custom:EtoileUI' 'custom:IconKit' 'custom:OgreKit' 'custom:ScriptKit' 'custom:XMPPKit' 'custom:XWindowServerKit' 'custom:imlib2' 'custom:Smalltalk' 'custom:LanguageKit' 'custom:Compiler' 'custom:AZBackground' 'custom:Corner' 'custom:DictionaryReader' 'custom:FontManager' 'custom:Jabber' 'custom:Typewriter' 'custom:CoreObjectExample' 'custom:LuceneKitExample')
depends=('gnustep-make>=2.00' 'gnustep-base>=1.15.3' 'gnustep-gui>=0.13.2' 'gnustep-back>=0.13.2' 'postgresql>=8.3' 'oniguruma>=5.0' 'ffmpeg' 'poppler' 'llvm-etoile>=2.4' 'lemon' 'taglib')
makedepends=('gcc>=4.1' 'libxss' 'gcc-objc')
optdepends=('oss: Replacement of alsa-oss for MediaKit')
conflicts=('etoile-svn')
replaces=('etoile-svn')
options=('!makeflags')
source=(http://download.gna.org/etoile/$pkgname-$pkgver.tar.bz2 'MKMediaFile.h.patch' 'etoile.make.patch' 'LanguageKit_Codegen.patch' 'CodegenLexicalScope.cpp.patch' 'LLVMCodeGen.cpp.patch' 'EtoileFoundation.patch')
md5sums=('14d587f439ae6d2ba127ceb4e07a44d7' '2d42f23fd08523231fd18ec134e0cb93' '61a37e5d770c042fa29f793b7f85435f' 'e6a7318f57795627c7ecf8c0d107c40c' 'f40d5cd96bd90e321062bb4e1c6a3c9d' 'cc9799dc2d85166fc5d9e8c8b596c42c' '931057ab44e67cffc8def3f7d4878244')

_pkgname=Etoile

build() {
  cd $srcdir/$_pkgname-$pkgver

	# Change the location of ffmpeg headers path	
	patch -Np1 < $srcdir/MKMediaFile.h.patch || return 1

  # Don't treat warnings as errors
	patch -Np0 < $srcdir/etoile.make.patch || return 1
	
	# Disable -Wno-Werror notifications
	patch -Np0 < $srcdir/LanguageKit_Codegen.patch || return 1

	# Trivial fix for GCC to find stdio.h
	patch -Np0 < $srcdir/CodegenLexicalScope.cpp.patch || return 1
  patch -Np0 < $srcdir/LLVMCodeGen.cpp.patch || return 1

	# Fix for x86-64 systems
	patch -Np0 < $srcdir/EtoileFoundation.patch || return 1

	source /etc/profile.d/GNUstep.sh

  make || return 1 
	
	# Licenses

	install -d 755 $pkgdir/usr/share/licenses/$pkgname
	
  install -m 644 Frameworks/CoreObject/COPYING $pkgdir/usr/share/licenses/$pkgname/CoreObject.license
	install -m 644 Frameworks/EtoileFoundation/COPYING $pkgdir/usr/share/licenses/$pkgname/EtoileFoundation.license
	install -m 644 Frameworks/EtoileSerialize/COPYING $pkgdir/usr/share/licenses/$pkgname/EtoileSerialize.license
	install -m 644 Frameworks/EtoileUI/COPYING $pkgdir/usr/share/licenses/$pkgname/EtoileUI.license
	install -m 644 Frameworks/IconKit/COPYING $pkgdir/usr/share/licenses/$pkgname/IconKit.license
  install -m 644 Frameworks/OgreKit/COPYING $pkgdir/usr/share/licenses/$pkgname/OgreKit.license
	install -m 644 Frameworks/ScriptKit/COPYING $pkgdir/usr/share/licenses/$pkgname/ScriptKit.license
	install -m 644 Frameworks/XMPPKit/COPYING $pkgdir/usr/share/licenses/$pkgname/XMPPKit.license	
	install -m 644 Frameworks/XWindowServerKit/COPYING $pkgdir/usr/share/licenses/$pkgname/XWindowServerKit.license
  install -m 644 Frameworks/XWindowServerKit/COPYING.imlib2 $pkgdir/usr/share/licenses/$pkgname/imlib2.license
	
	install -m 644 Languages/Smalltalk/COPYING $pkgdir/usr/share/licenses/$pkgname/Smalltalk.license
	install -m 644 Languages/LanguageKit/COPYING $pkgdir/usr/share/licenses/$pkgname/LanguageKit.license
	install -m 644 Languages/Compiler/COPYING $pkgdir/usr/share/licenses/$pkgname/Compiler.license
	
	install -m 644 Services/Private/AZBackground/COPYING $pkgdir/usr/share/licenses/$pkgname/AZBackground.license
	install -m 644 Services/Private/Corner/LICENSE $pkgdir/usr/share/licenses/$pkgname/Corner.license
	
	install -m 644 Services/User/DictionaryReader/COPYING $pkgdir/usr/share/licenses/$pkgname/DictionaryReader.license
	install -m 644 Services/User/FontManager/COPYING $pkgdir/usr/share/licenses/$pkgname/FontManager.license
	install -m 644 Services/User/Jabber/LICENSE $pkgdir/usr/share/licenses/$pkgname/Jabber.license
	install -m 644 Services/User/Typewriter/COPYING $pkgdir/usr/share/licenses/$pkgname/Typewriter.license	

	install -m 644 Developer/Examples/CoreObjectExample/COPYING $pkgdir/usr/share/licenses/$pkgname/CoreObjectExample.license
	install -m 644 Developer/Examples/LuceneKitExample/COPYING $pkgdir/usr/share/licenses/$pkgname/LuceneKitExample.licenese

  make DESTDIR=$pkgdir install || return 1
}

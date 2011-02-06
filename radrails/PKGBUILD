# Contributor: Andrew Barilla <andrew@exit66.com>
pkgname=radrails
pkgver=0.7.2
pkgrel=2
pkgdesc="RadRails is an integrated development environment for the Ruby on Rails framework"
url="http://www.radrails.org"
depends=('jre')
makedepends=()
arch=(i686 x86_64)
source=(http://dl.sourceforge.net/sourceforge/radrails/radrails-0.7.2-linux-gtk.tar.gz http://www.exit66.com/arch/radrails/radrails.desktop)
md5sums=('dcccfd9e47f3141904e4eaa9df6b5655'
	'3b0586eedc5dd9686dfb16d89d70d7ee')
	
build() {
	mkdir -p $startdir/pkg/opt/radrails
	cp -r $startdir/src/radrails/* $startdir/pkg/opt/radrails/
	mkdir -p $startdir/pkg/usr/share/applications
	install -m644 $startdir/radrails.desktop $startdir/pkg/usr/share/applications
}

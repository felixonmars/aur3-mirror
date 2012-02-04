# Contributor: Xavier de Labouret <arch@2-lab.net>
pkgname=kye-levels
pkgver=2007.02.17
pkgrel=2
pkgdesc="Additional levels for the Kye game"
arch=('i686')
url="http://www.classicgaming.com/kye/"
#licence=('GPL')
makedepends=('unzip')
depends=('kye')
source=(\
	http://www.classicgaming.com/kye/levels/2Fun4Me.zip \
	http://www.classicgaming.com/kye/levels/Action2.zip \
	http://www.classicgaming.com/kye/levels/AntKye2.zip \
	http://www.classicgaming.com/kye/levels/Beginner.zip \
	http://www.classicgaming.com/kye/levels/Danish.zip \
	http://www.classicgaming.com/kye/levels/Garyskye.zip \
	http://www.classicgaming.com/kye/levels/InARush.zip \
	http://www.classicgaming.com/kye/levels/Newkye.zip \
	http://www.classicgaming.com/kye/levels/RComb.zip \
	http://www.classicgaming.com/kye/levels/Ricardo.zip \
	http://www.classicgaming.com/kye/levels/TPsKye.zip \
	http://www.classicgaming.com/kye/levels/Training.zip \
	http://www.classicgaming.com/kye/levels/afebrile.zip \
	http://www.classicgaming.com/kye/levels/alanskye.zip \
	http://www.classicgaming.com/kye/levels/gsmick.zip \
	http://www.classicgaming.com/kye/levels/hoards.zip \
	http://www.classicgaming.com/kye/levels/jg.zip \
	http://www.classicgaming.com/kye/levels/nelsons.zip \
	http://www.classicgaming.com/kye/levels/philsel1.zip \
	http://www.classicgaming.com/kye/levels/sampler.zip \
	)
md5sums=(\
	'abd607a485890dea966a0306f4996be8' \
	'7cc81b867fcb24e8a59e068cecffce11' \
	'fe4a29bb544ce1bec395c651d2558190' \
	'dfc47c6caca9cc27512325c17ec481f3' \
	'fa74fb4eb47aa4f018ae4e903f25b30d' \
	'1f4b1caba014586d6f940051c4a98861' \
	'e9ca2445c695b6c191597d498ce269f8' \
	'8732e413ae7b623385890e31bbeb36ce' \
	'45618b1a8f27e87b8e7a4e3d6452bf13' \
	'dade7bcdf1fe05704cf1d982fdbc0519' \
	'd7b766dcf40bf8bb275f86a7fb7aae28' \
	'a765aa10ca3cdd6a4bcaee20df7c80ae' \
	'fe0af6b76911b8f893e00177215ff649' \
	'61e1e1bd0449520e8536c06a10afbb7e' \
	'abedb4951b5ad73a73d13f7ccfc7851b' \
	'2471de7c5f9bb7d4a4eacb94be24ac4a' \
	'224c0b8e5c3dd55d18cad579ecefb3a1' \
	'2730783d488355d9be24ed40a3be2843' \
	'6612a3aaf09a0abc3f720b3ad4683dd9' \
	'8bfac11f13554bb84864c086a0cad9c9' \
	)

build()
{
	mkdir -p $startdir/src/unzip
	cd $startdir/src/

	mkdir -p $startdir/pkg/usr/share/kye
	install -D -m644 $startdir/src/*.kye $startdir/pkg/usr/share/kye
}

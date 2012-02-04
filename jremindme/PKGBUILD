# Contributor: KillaB <xGenoBlast@gmail.com>

pkgname=jremindme
pkgver=1.4
pkgrel=1
pkgdesc="A Java program that reminds you to do things"
arch=("i686" "x86_64")
url="http://sj.arc-nova.org/?page=jRemindMe"
license=("unknown")
depends=("jre") # It doesn't work with openjdk6
provides=("powder")
source=(http://sj.arc-nova.org/Program%20Updates/0/jRemindMe-1-4.zip jRemindMe
	jremindme.desktop)
install=(jremindme.install)
md5sums=('2249c67a4da97f7920733923267496ad' '91977c81498a84b4de6129233cd12bbe'
	'27b4ebba2c2ef50aa50b8d182e4fd8b5')

build() {
	cd "${srcdir}"
	install -D jRemindMe.jar "${pkgdir}/usr/share/jRemindMe/jRemindMe.jar"
	install -Dm755 jRemindMe "${pkgdir}/usr/bin/jRemindMe"
	install -D jremindme.desktop "${pkgdir}/usr/share/applications/jremindme.desktop"
	ln -s "/usr/bin/jRemindMe" "${pkgdir}/usr/bin/jremindme"
}


# Contributor: Jim Pryor <jim@jimpryor.net>

pkgname=sleepd-git
pkgver=20100804
pkgrel=1
pkgdesc="daemon to put laptop to sleep when it's not being used or its battery is low"
arch=('i686' 'x86_64')
url="http://joey.kitenet.net/code/sleepd/"
license=('GPL')
# can also be built with libhal dependency
# depends=('hal')
makedepends=('git')
backup=('etc/conf.d/sleepd')
options=(docs)
install='sleepd.install'

source=(sleepd.conf sleepd.rc from_apmd.h no-apmd.patch)
md5sums=('a9dfb662da15d0b0ad05a4fd6be234a9'
         '0904b5ba3ba6b33e0491aa08c6aa75ca'
         'b472409aba64835b3c37e92edddbce5d'
         '77ad58101f81816d8f0870204d34183b')

_gitroot="git://git.kitenet.net/sleepd"
_gitname="sleepd"

build() {
	cd "$srcdir"
	if [[ -d "$_gitname" ]]; then
		msg "Updating Git repository"
		(cd "$_gitname"; git pull origin) 
	else
		msg "Checking out fresh Git repository"
		git clone "$_gitroot" # "$_gitname"
	fi
	msg "Copying files"
	rm -rf "${_gitname}-build"
	cp -HR --preserve=all "${_gitname}" "${_gitname}-build"
	cd "${_gitname}-build"
	msg "Starting build..."

	cp "$srcdir/from_apmd.h" .
	patch -p1 -i "$srcdir/no-apmd.patch" || return 1

	make USE_HAL="" || return 1
	make USE_HAL="" PREFIX="$pkgdir" install || return 1

	install -D -m755 "$srcdir/${pkgname%-git}.rc" "$pkgdir/etc/rc.d/${pkgname%-git}"
	install -D -m644 "$srcdir/${pkgname%-git}.conf" "$pkgdir/etc/conf.d/${pkgname%-git}"

}

# vim:syntax=sh

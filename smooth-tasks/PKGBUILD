# Maintainer: Dylon Edwards <deltaecho@archlinux.us>

pkgname=smooth-tasks
pkgver=wip_2010_11_06
pkgrel=3

url="http://kde-look.org/content/show.php/Smooth+Tasks?content=101586"
pkgdesc="A taskbar replacement Plasmoid with window peeking similar to Windows 7."
license=('GPLv2')

arch=('x86_64' 'i686')

# Added an extra '_' to the following variables to override makepkg's default versioning scheme
__hgroot="https://bitbucket.org/panzi"
__hgrepo="smooth-tasks"

source=('Applet.cpp.patch')
md5sums=('4261d47f5ec73593fa542a56f9aad6a3')

depends=('kdebase-workspace>=4.7.0')
makedepends=('automoc4' 'cmake' 'mercurial' 'coreutils' 'perl')

### NOTE ###################################################
# To get the most up-to-date version of this plasmoid, you #
# don't have to wait for me to update the PKGBUILD -- the  #
# way I've engineered it, simply running `makepkg -f' is   #
# enough.                                                  #
############################################################

function build() 
{
	# Checkout / Update the plasmoid's source
	if [[ -d "${__hgrepo}/.hg" ]]; then
		( cd "${__hgrepo}" && hg pull -u )
	else
		hg clone "${__hgroot}/${__hgrepo}"
	fi

	# Copy the source to a build directory
	cp -a "${__hgrepo}" "${__hgrepo}-build" &&
	cd "${__hgrepo}-build" || return 1

	patch -Np0 -i ../Applet.cpp.patch || return 1

	# Compile the plasmoid
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
	make || return 1

	# Hack to get the correct pkgver :)
	pkgver="$(head -n 1 ChangeLog | perl -pe 's|^.*(wip)\s+(\d{4})-(\d{2})-(\d{2}).*$|\1_\2_\3_\4|')"

	# Make sure the pkgver is not null
	if [[ -n "${pkgver}" ]]; then
		export pkgver="${pkgver}"
		echo "${pkgver}" > "${pkgname}-pkgver.txt"
	fi
}

function package()
{
	cd "${__hgrepo}-build"

	# Install the plasmoid
	make DESTDIR="${pkgdir}" install || return 1

	# Get the correct pkgver
	if [[ -f "${pkgname}-pkgver.txt" ]]; then
		pkgver="$(cat ${pkgname}-pkgver.txt)"

		# Export the pkgver if it is not null
		if [[ -n "${pkgver}" ]]; then
			export pkgver="${pkgver}"
	
			# Set the correct pkgver in the PKGBUILD
			perl -pi -e "s|^(\t?)pkgver=wip_\d{4}_\d{2}_\d{2}$|\1pkgver=${pkgver}|g" "${startdir}/PKGBUILD"
		fi
	fi

	# Remove the build directory
	cd "${srcdir}" &&
	rm -rf "${__hgrepo}-build"

	# A little something for the AUR ...
	:<<-'EOF'
	pkgver=wip_2010_11_06
	EOF
}

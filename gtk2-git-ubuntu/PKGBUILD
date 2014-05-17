# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: hbdee <hbdee.arch@gmail.com>

pkgname=gtk2-git-ubuntu
_gitname=gtk+
_bzrdir=~ubuntu-desktop/gtk/ubuntu
pkgver=2.24.23.11.g7eb1c77
pkgrel=1
pkgdesc="GTK+ is a multi-platform toolkit (v2) (git version with ubuntu patches from bzr)"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('LGPL')
depends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' \
	'libxdamage' 'shared-mime-info' 'libcups' 'gtk-update-icon-cache' 'python2')
makedepends=('pkg-config' 'gobject-introspection' 'gtk-doc')
provides=("gtk2=${pkgver}" "gtk2-ubuntu=${pkgver}" "gtk2-git=${pkgver}")
conflicts=('gtk2' 'gtk2-ubuntu')
replaces=('gtk2-docs')
backup=('etc/gtk-2.0/gtkrc')
options=('!libtool')
install=arch_gtk2.install
source=('git://git.gnome.org/gtk+#branch=gtk-2-24'
        'arch_xid-collision-debug.patch'
        'fix-ubuntumenuproxy-build.patch'
	'repatch-backport_gtkmountoperation_signal_fix.patch')
sha512sums=('SKIP'
            '89e3223c86731a76b12d39245f1ec4cf8b4860ab1d11d74a10e5deb0db302f20b4bb5d9034da1d8aeb96369dbdeddcdd2f28943270dc501476c694562b960159'
            '4b27afecb82e3517c2584665f8d2a2911193254a00b82ff8064caf4016ab029c76e99af502bb9271a66209594b50b2729797defcc9512d341aa61aff4f64ec24'
            '8f5755382d7094571e9eff4519b1da6e7b07195dd381d9f7db42d1311c3f1016539653dc58e19e9853787d87130f271ca5578538e69dc07d0b96502a38d6af98')

pkgver() {
	cd "${_gitname}"
	git describe --always | sed 's/-/./g'
}

prepare() {

	if [ ! -d "${srcdir}/../ubuntu/" ]; then 
		mkdir "${srcdir}/../ubuntu/"
		cd "${srcdir}/../ubuntu/"
		#Pull latest Ubuntu patchset (minus git cherry-picks)
		bzr cat lp:"${_bzrdir}/debian/patches/series" > series
		while read i; do
    			if [[ "${i}" =~ ^# || -z "${i}" || "${i}" == *git* ]]; then
				continue # Skip comments, newlines, and git patches
			else
				msg "Downloading ${i} ..."
				bzr cat -q lp:"${_bzrdir}/debian/patches/${i}" > "${i}"
				#Apply available repatches
				if [ -f "../repatch-${i}" ]; then
					msg "Updating ${i} ..." 
					patch -si "../repatch-${i}"
				fi
			fi
		done < series
			
	fi
	ln -s "${srcdir}/../ubuntu/"* "${srcdir}/"
}

build() {

	cd "${_gitname}"

	#Apply Ubuntu patches
	while read i; do
    		if [[ "${i}" =~ ^# || -z "${i}" || "${i}" == *git* ]]; then
			continue
		else
			msg "Applying ${i} ..."
			patch -Nsp1 -i  "${srcdir}/${i}"
		fi
	done < "${srcdir}/series"

	#Apply Arch patches
	patch -p1 -i "${srcdir}/arch_xid-collision-debug.patch"
  
	# Build fix from György Balló
	patch -p1 -i "${srcdir}/fix-ubuntumenuproxy-build.patch"

	#autoreconf -vfi

	#CXX=/bin/false ./configure \
	#Use autogen.sh to avoid "automake: error: cannot open < gtk-doc.make: No such file or directory"

	CXX=/bin/false ./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--with-xinput=yes \
		--enable-test-print-backend

	# https://bugzilla.gnome.org/show_bug.cgi?id=655517
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package() {
  cd "${_gitname}"

  make DESTDIR="${pkgdir}" install
  sed -i "s#env python#env python2#" "${pkgdir}/usr/bin/gtk-builder-convert"
  echo 'gtk-fallback-icon-theme = "gnome"' > "${pkgdir}/etc/gtk-2.0/gtkrc"
  # Use the official gtk-update-icon-cache package
  rm -v "${pkgdir}/usr/bin/gtk-update-icon-cache"
}

# Maintainer: N30N <archlinux@alunamation.com>
# Contributor: rickeyski <rickeyvisinski@gmail.com>

pkgname="csslint-git"
pkgver=20120616
pkgrel=1
pkgdesc="Automated linting of Cascading Stylesheets."
url="http://csslint.net/"
license=("MIT")
arch=("any")
provides=("csslint")

depends=("rhino")
makedepends=("git" "apache-ant")

# depends=("nodejs")
# makedepends=("git" "apache-ant" "nodejs-npm")

_gitroot="https://github.com/stubbornella/csslint.git"
_gitname="csslint"

build() {
	if [ -d "${_gitname}" ]; then
		cd "${_gitname}"
		git clean -dfx
		git reset --hard
		git pull origin
	else
		git clone "${_gitroot}"
		cd "${_gitname}"
	fi

	if [ "${depends[0]}" = "nodejs" ]; then
		ant build.node
	elif [ "${depends[0]}" = "rhino" ]; then
		ant build.rhino
		sed -r "s/(csslint)-rhino\.js/\1/" -i build/csslint-rhino.js
		cat <<-EOF > "${srcdir}/csslint.sh"
			#!/bin/sh
			exec java -jar /usr/share/java/js.jar "/usr/share/${_gitname}/csslint-rhino.js" \${@}
		EOF
	fi
}

package() {
	cd "${srcdir}/${_gitname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	if [ "${depends[0]}" = "nodejs" ]; then
		cd build/npm/
		sed -i "s/@VERSION@/0.9.3/" package.json
		npm install -g --prefix "${pkgdir}/usr"
	elif [ "${depends[0]}" = "rhino" ]; then
		install -Dm755 "${srcdir}/csslint.sh" "${pkgdir}/usr/bin/csslint"
		install -Dm644 build/csslint-rhino.js "${pkgdir}/usr/share/${_gitname}/csslint-rhino.js"
	fi
}

# vim: set noet ff=unix:

# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=gitlab-git
pkgver=e29ec30
pkgrel=1
pkgdesc="Project management and code hosting application"
arch=('any')
url="https://www.gitlab.org"
license=('MIT')
depends=('ruby' 'git' 'ruby-bundler' 'python2' 'gitlab-shell' 'openssh' 'redis')
makedepends=('libxslt' 'icu')
optdepends=(
    'mariadb: database backend'
    'postgresql: database backend'
    'python2-docutils: reStructuredText markup language support'
    'postifx: mail server in order to receive mail notifications'
)
conflicts=('gitlab')
replaces=('gitlab')
provides=('gitlab')
_server=''
if [[ -n $(which httpd 2> /dev/null) ]]; then
	backup=('etc/httpd/conf/extra/gitlab.conf'
		'etc/httpd/conf/extra/gitlab-ssl.conf')
	_server='apache'
fi
if [[ -n $(which nginx 2> /dev/null) ]]; then
	backup=('etc/nginx/sites-available/gitlab-ssl')
	_server='nginx'
fi
if [[ -n $(which lighttpd 2> /dev/null) ]]; then
	backup=('etc/lighttpd/conf.d/10-gitlab.conf')
	_server='lighttpd'
fi
backup=('etc/webapps/gitlab/gitlab.yml' 'etc/webapps/gitlab/database.yml' 'etc/webapps/gitlab/unicorn.rb')
source=("git+https://gitlab.com/gitlab-org/gitlab-ce.git"
        "gitlab.target"
        "gitlab-unicorn.service"
        "gitlab-sidekiq.service"
        "gitlab.conf"
        "gitlab-ssl.conf"
        "gitlab-ssl"
        "10-gitlab.conf"
        "gitlab.tmpfiles.d")
install='gitlab.install'
sha512sums=("SKIP"
            "c88b7b500225c9a2bfaf10912fc09e5a3beb7c28890dcc1d49d55dfe92df02cef3f1865a138e7e2802b4e795c9a45cb130819be0a1c115eca9b566b8b9fb4395"
            "6722a5dade6ecf59b4a4b23948360edac6944a88da289da43e34fed0837cb5cbdbb54067b2561c065e40f728951d5d3d4b5da0eee276800cad95705cea06466d"
            "82775be4af322312f2009c28864b671c5c19d1d2e3e4535a77a2fd288bde592e78367f5e7d3e7fc9994ab8b36fd8ae9c5baa41ba4c6a197433b212522b58d40e"
            "f021ddcaaf8f4e92db7684f3a7eb34d4d00911efe5a3d57bc78ebb0b9636b2639b1990047c8da3f6d7339ad7a89574cfbfeb59a79c30b099e6f44ecfbf3166f7"
            "12b1775f9457d62657e388125b6f6a24a87577632696d3f7b8d5765deb57c2feba13fe8037e93fc362f6d328f3cf00183ff563631ef6b4b8badf104af126854d"
            "7fbb34affa6d69fa89f0f64980de515e1f6fc62d5279559956d514168595a19e1ad6b93867b626d8b80606357623ff44df3f8640c85d00da081a0f5b61997d67"
            "6b058dd92a9c7a8f603cce968d12ce41c3f1fe82936a83e749bc8d88fb2481130c8fda07b97979df307566e76dfea8434f77b6a83036dff5bcd9646d3222bf30"
	        "b98ba6cbd8745a649046386f4aad6ee3d869b8e14820560e25b3207683dcd0841e1af8afb5537e6e06bf19d9436489420db59348c57f4c096c69b0ea4f2e7978")
options=('!strip')
_homedir="/var/lib/gitlab"
_datadir="/usr/share/webapps/gitlab"
_wo=""

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | sed 's|-|.|g'
}

prepare() {
	if [[ `pacman -T libmariadbclient` != '' ]]; then
		_wo="${_wo} mysql"
	fi
	if [[ `pacman -T postgresql-libs` != '' ]]; then
		_wo="${_wo} postgres"
	fi
	if [[ $(echo "${_wo}" | wc -w ) == 2 ]]; then
		error "Usable DB libs not found"
		msg2 "Install at least libmariadbclient or postgresql-libs"
		return 1
	fi

    cd "${srcdir}/gitlab-ce"

    # Patching config files:
    sed -e "s|# user: git|user: gitlab|" \
        -e "s|/home/git/repositories|${_homedir}/repositories|" \
        -e "s|/home/git/gitlab-satellites|${_homedir}/satellites|" \
        -e "s|/home/git/gitlab-shell|/usr/share/gitlab-shell|" \
        config/gitlab.yml.example > config/gitlab.yml
    sed -e "s|/home/git/gitlab/tmp|${_homedir}|g" \
        -e "s|/home/git/gitlab|${_datadir}|g" \
		-e "s|timeout 30|timeout 300|" \
		-e "s|/var/lib/gitlab/pids|/run/gitlab|g" \
		config/unicorn.rb.example > config/unicorn.rb
	sed -e "s|username: git|username: gitlab|" \
		config/database.yml.mysql > config/database.yml
}
build() {
    cd $srcdir/gitlab-ce
    msg "Fetching bundled gems..."
    # Gems will be installed into vendor/bundle
    bundle install --no-cache --no-prune --deployment --without development test aws
}

package() {
    cd "${srcdir}/gitlab-ce"
    install -d "${pkgdir}/usr/share/webapps"
	cp -r "${srcdir}/gitlab-ce" "${pkgdir}${_datadir}"

    # Creating directories
    install -d \
        "${pkgdir}/etc/webapps/gitlab" \
        "${pkgdir}/usr/share/webapps" \
        "${pkgdir}/usr/share/doc/${pkgname}" \
		"${pkgdir}${_homedir}/www" \
		"${pkgdir}${_datadir}/www" \
		"${pkgdir}${_datadir}/public/uploads"
	ln -fs /run/gitlab "${pkgdir}${_homedir}/pids"

	# Install config files
	for _file in gitlab.yml unicorn.rb database.yml; do
		mv "config/${_file}" "${pkgdir}/etc/webapps/gitlab/"
		[[ -f "${pkgdir}${_datadir}/config/${_file}" ]] && rm "${pkgdir}${_datadir}/config/${_file}"
		ln -s "/etc/webapps/gitlab/${_file}" "${pkgdir}${_datadir}/config/"
	done

    # Install license and help files
    mv README.md MAINTENANCE.md CONTRIBUTING.md CHANGELOG config/*.{example,mysql,postgresql} "${pkgdir}/usr/share/doc/${pkgname}"
    install -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${pkgdir}/usr/share/webapps/gitlab/LICENSE"

	# Install systemd service files
	for _file in gitlab.target gitlab-unicorn.service gitlab-sidekiq.service; do
		install -Dm0755 "${srcdir}/${_file}" "${pkgdir}/usr/lib/systemd/system/${_file}"
	done

	install -Dm644 "${srcdir}/gitlab.tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/gitlab.conf"

	# Install apache, nginx and lighttpd template files (if they are installed)
	case ${_server} in
		apache)
			install -d "${pkgdir}/etc/httpd/conf/extra"
			install -m 644 "${srcdir}/gitlab.conf" "${pkgdir}/etc/httpd/conf/extra/"
			install -m 644 "${srcdir}/gitlab-ssl.conf" "${pkgdir}/etc/httpd/conf/extra/"
			;;
		nginx)
			install -d "${pkgdir}/etc/nginx/sites-enabled"
			install -m 644 "${srcdir}/gitlab-ssl" "${pkgdir}/etc/nginx/sites-enabled/"
			;;
		lighttpd)
			install -d "${pkgdir}/etc/lighttpd/conf.d"
			install -m 644 "${srcdir}/10-gitlab.conf" "${pkgdir}/etc/lighttpd/conf.d/"
			;;
	esac
}

# vim:set ts=4 sw=4 et:

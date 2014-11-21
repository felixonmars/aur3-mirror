# Maintainer: Guido Masella <guidomasella@gmail.com>
pkgname=devdocs-git
_gitname=devdocs
pkgver=r460.31d5b9d
pkgrel=4
pkgdesc="Combines multiple API documentations in a fast, organized, and searchable interface."
arch=('i386' 'x86_64')
url="https://github.com/Thibaut/devdocs"
license=('Custom')
depends=('ruby' 'nodejs' 'ruby-bundler' 'bash' 'java-environment-common')
makedepends=('git')
optdepends=()
provides=(devdocs)
conflicts=(devdocs)
options=()
install=devdocs.install
source=("$_gitname::git+https://github.com/Thibaut/devdocs.git"
        devdocs.service
        devdocs.sh
        devdocs.install)
noextract=()
md5sums=('SKIP'
         '82828bc2cb53c2a98e0701aa4bab73e7'
         '7e27b567b74c656737301a4cf18427cc'
         '0bbf9aa2446f88ad13915df1564d99ce')
_datadir="/usr/share/webapps/${_gitname}"
_homedir="/var/lib/${_gitname}"
_systemddir="/usr/lib/systemd/system"
_etcdir="/etc/webapps/${_gitname}"
_logdir="/var/log/${_gitname}"

prepare() {
    cd "${_gitname}"
    msg "fixing ruby version ..."
    find . -type f -print0 | xargs -0 sed -i 's#2.1.4#2.1.5#g'
}

build() {
    cd "${_gitname}"
    msg "installing missing gems in vendor/bundle ..."
    bundle install --deployment
}

package() {
    cd "${_gitname}"

    rm -rf ${srcdir}/${_gitname}/git
    install -d "${pkgdir}/usr/share/webapps"
    cp -r "${srcdir}/${_gitname}" "${pkgdir}${_datadir}"

    msg2 "Creating directories and symlinks..."
    install -d \
        "${pkgdir}${_homedir}" \
        "${pkgdir}/usr/lib/systemd/system"

    mv "${pkgdir}${_datadir}/public" "${pkgdir}${_homedir}/public" && \
            ln -fs "${_homedir}/public" "${pkgdir}${_datadir}/public"
    rm -rf "${pkgdir}${_datadir}/tmp" && ln -sf "/var/tmp" "${pkgdir}${_datadir}/tmp"
    rm -rf "${pkgdir}${_datadir}/log" && ln -sf "${_logdir}" "${pkgdir}${_datadir}/log"

    msg2 "Installing systemd service file"
    install -Dm0644 "${srcdir}/devdocs.service" "${pkgdir}/${_systemddir}/devdocs.service"

    msg2 "Installing license and documentation"
    install -d "$pkgdir/usr/share/doc/${_gitname}"
    mv "README.md" "CONTRIBUTING.md" "COPYRIGHT" "${pkgdir}/usr/share/doc/${_gitname}"
    install -D "LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE.txt"

    msg2 "Installing executables in /usr/bin"
    install -D -m755 "$srcdir/devdocs.sh" "$pkgdir/usr/bin/devdocs"
}

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

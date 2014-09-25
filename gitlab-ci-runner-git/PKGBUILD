# Maintainer: mawcomw <mawcomw@gmail.com>
pkgname=gitlab-ci-runner-git
pkgver=5
pkgrel=1
pkgdesc="Gitlab-CI runner"
arch=('any')
url="https://github.com/gitlabhq/gitlab-ci-runner"
license=('GPL2')
depends=('ruby'
         #'gitlab-ci'
         #'gitlab'
         'libxml2'
         'libxslt'
         'git'
)
#makedepends=('glibc' 'dialog')
#checkdepends=()
#optdepends=('ruby: a dynamic, interpreted, open source programming language'
#           'rvm: a command line tool to easily manage multiple Ruby environments'
#           'rbenv: another command line tool to easily manage multiple Ruby environments'
#           'apache: a supported application server'
#           'nginx: a supported application server'
#           'tomcat6: a supported application server'
#           'tomcat7: a supported application server'
#           'mariadb: MariaDB database support'
#           'mysql: MySQL database support'
#           'postgresql: PostgreSQL database support'
#           'git: Git repository browsing'
#           'subversion: Subversion repository browsing'
#           'darcs: Darcs repository browsing'
#           'bzr: Bazaar repository browsing'
#           'mercurial: Mercurial repository browsing'
#           'cvs: CVS repository browsing'
#           'imagemagick: Image export support for Gantt')
provides=('gitlab-ci-runner')
#conflicts=()
#replaces=()
#backup=('usr/share/webapps/redmine/config/configuration.yml'
#    'usr/share/webapps/redmine/config/database.yml')
#options=()
install=gitlab-ci-runner.install
#changelog
source=(".tar.gz::https://github.com/gitlabhq/gitlab-ci-runner/archive/master.tar.gz"
	gitlab-ci-runner.service
	gitlab-ci-runner.install
)
#noextract
sha512sums=('ae8278cfddf212facb12cd05a8174b4c4dc9f29a54bddfb62ccb80cdb1bb994f4e39a4a9483572d5ffb22111afbbad1ee3b64312bf6cdedece4f056576432fb1'
	    'c3dcc88c91dfe3a29a4ae819b08118930d746a66200338f5fd14a0db27c0b2140a83c0be88003846ed465dc57d6cc8a1eb58ea704e6e1ddf2f3c96ffe02b1181'
	    '63c63ff947d39fd81a6e3a3cc00983649d1794b9619a02e6e27f31644bfc6c08d1c53e2b7032d8b606c3fd0c035cb45795939cfa0b91ad44a7eed7edb508b2c5'
)

build() {
    return 0
}

package() {
     _gitlab_ci_runner_installation_path="/usr/share/webapps/gitlab-ci-runner"
    cd "$srcdir/gitlab-ci-runner-master"
    # install in /usr/share/webapps
    _instdir="${pkgdir}/${_gitlab_ci_runner_installation_path}"
    echo ${instdir}
    mkdir -p ${_instdir}
    cp -ra . ${_instdir}

    # create required directories
    mkdir -p "${_instdir}/public/plugin_assets"
    mkdir -p "${_instdir}/tmp/pdf"
    mkdir -p "${_instdir}/files"
    mkdir -p "${_instdir}/log"
    
    # set the group that will run the http server to have write permission (for apache it should be http)
    chmod -R g+w "${_instdir}/tmp"
    chmod g+w "${_instdir}/files"
    chmod g+w "${_instdir}/log"
    
    # set the http server user:group that will run the application
    #chgrp -R gitlab ${_instdir}

    # Create systemd service
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    install -m 644 "$srcdir/gitlab-ci-runner.service" "$pkgdir/usr/lib/systemd/system/"
    echo "Install the gems for the runner: bundle install --deployment"
}
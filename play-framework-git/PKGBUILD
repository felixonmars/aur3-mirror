# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=play-framework-git
_pkgname=play-framework
pkgver=20120620
pkgrel=1
pkgdesc="Java/Scala web framework focused on developer productivity."
arch=(any)
url="http://www.playframework.org"
license=(APACHE)
depends=('java-environment>=5' 'bash')
makedepends=('git' 'apache-ant')
optdepends=('zsh-completions: zsh auto-completion for the play command')
install=${pkgname}.install
options=(!strip emptydirs)
changelog=Changelog
provides=(${_pkgname})
conflicts=(${_pkgname} sox)

_gitroot=git://github.com/playframework/play.git
_gitname=playframework

build() {
  msg2 "Connecting to GIT server...."
  if [ -d "${srcdir}/${_gitname}" ] ; then
    ( cd "${srcdir}/${_gitname}" && git pull origin )
    msg2 "The local files are updated."
  else
    git clone ${_gitroot} "${srcdir}/${_gitname}" --depth 1
  fi

  msg2 "Building..."
  cd "${srcdir}"/${_gitname}/framework
  ant || return 1

  msg2 "Generate scripts for /etc/profile.d..."
  cat <<EOF > "${srcdir}"/${_pkgname}.profile.d.sh
export PLAY_HOME=/opt/${_pkgname}
EOF
  cat <<EOF > "${srcdir}"/${_pkgname}.profile.d.csh
setenv PLAY_HOME "/opt/${_pkgname}"
EOF

  msg2 "Generate executable for /usr/bin..."
  cat <<EOF > "${srcdir}"/${_pkgname}.sh
#!/bin/sh
python2 \${PLAY_HOME}/play "\$@"
EOF

  msg2 "Strip unneeded stuff from distribution..."
  rm -rf "${srcdir}"/${_gitname}/python
}

check() {
  # Make tests run with Python 2
  find "${srcdir}"/${_gitname} -type f -exec sed -i '1s/python/python2/' {} \;
  sed -i 's/executable=\"python\"/executable=\"python2\"/' "${srcdir}"/${_gitname}/framework/build.xml

  cd "${srcdir}"/${_gitname}/framework
  ant test
}

package() {
  msg2 "Install the assembly at /opt/${_pkgname}..."
  install -dm755                  "${pkgdir}"/opt/${_pkgname}
  cp -r "${srcdir}"/${_gitname}/* "${pkgdir}"/opt/${_pkgname}

  msg2 "Install link to executable at /usr/bin/play..."
  install -dm755              "${pkgdir}"/usr/bin
  ln -s /opt/${_pkgname}/play "${pkgdir}"/usr/bin/

  msg2 "Install links to the documentation resources at /usr/share/doc/${_pkgname}..."
  install -dm755                       "${pkgdir}"/usr/share/doc/${_pkgname}
  ln -s /opt/${_pkgname}/README.md     "${pkgdir}"/usr/share/doc/${_pkgname}/README.md
  ln -s /opt/${_pkgname}/documentation "${pkgdir}"/usr/share/doc/${_pkgname}/documentation
  ln -s /opt/${_pkgname}/samples       "${pkgdir}"/usr/share/doc/${_pkgname}/samples
}

# vim:set ts=2 sw=2 et:

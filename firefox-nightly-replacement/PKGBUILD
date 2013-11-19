# Maintainer: fmoralesc
# Contributors: Dan Serban, L42y, aeosynth, karol_007

pkgname=firefox-nightly-replacement
pkgver=28.0a120131118
pkgrel=1
pkgdesc="Nightly channel, as a replacement for regular firefox"
url=http://www.mozilla.org/projects/firefox/
arch=(i686 x86_64)
license=(MPL GPL LGPL)
provides=('firefox')
conflicts=('firefox' 'firefox-aurora')
depends=(desktop-file-utils libxt mime-types nss shared-mime-info)
source=(firefox.desktop
        firefox-safe.desktop)
md5sums=('5d343477fbd8d62f0d61f13c7781a17c'
         'd0e1e1d9208df02d1c0811d6a1725c76')

_url_prefix="ftp://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central/"
_l10n_url_prefix="ftp://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central-l10n/"
# if _lang is set to something else than the empty string, 
# we will try to fetch the corresponding localized version.
# we can use the value of LANG to set this
_use_LANG=0
if [[ $_use_LANG == 0 ]]; then
    # if you dont' want to use the value of LANG, but want to use an i10n build, set it here:
    # NOTE: the format for this variable is like in LANG, but with '-' instead of '_'
    _lang=""
else
    _lang=`echo $LANG | awk -NF '.' '{print $1}' | tr _ -`
fi


pkgver()
{
  wget --spider --no-remove-listing --no-verbose "${_url_prefix}*linux-${CARCH}.tar.bz" 2>/dev/null
  _file=`awk '/linux-'${CARCH}'.tar.bz/ {print $NF}' .listing | grep -v asc | tail -1 | tr -d '\r'`
  echo $(echo ${_file} | grep -oP '(?<=-)\d*?\..*?.(?=\.)')$(date +%Y%m%d)
}

package()
{
  if [[ -z $_lang ]]; then
	  wget --spider --no-remove-listing --no-verbose "${_url_prefix}*linux-${CARCH}.tar.bz" 2>/dev/null
	  _file=`awk '/linux-'${CARCH}'.tar.bz/ {print $NF}' .listing | grep -v asc | tail -1 | tr -d '\r'`
  else
	  wget --spider --no-remove-listing --no-verbose "${_l10n_url_prefix}*linux-*.tar.bz" 2>/dev/null
	  _file=`awk '/'${_lang}'.linux-'${CARCH}'.tar.bz/ {print $NF}' .listing | grep -v asc | tail -1 | tr -d '\r'`
  fi
  if [[ -a ${_file} ]]; then 
      msg "Already have the file..."
  else
      msg "Downloading..."
      if [[ -z $_lang ]]; then
	      wget ${_url_prefix}${_file}
      else
	      wget ${_l10n_url_prefix}${_file}
	  fi
  fi
  msg "Extracting..."
  bsdtar -xf ${_file}
  mkdir -p "${pkgdir}"/{usr/{bin,share/applications},opt}
  mv firefox "${pkgdir}"/opt/
  ln -s /opt/firefox/firefox "${pkgdir}"/usr/bin/firefox
  install -m644 "${startdir}"/{firefox.desktop,firefox-safe.desktop} "${pkgdir}"/usr/share/applications/
}
